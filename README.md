# WiLiKi and cgi-throttle bridge

This module makes it easy to adopt [cgi-throttle](https://github.com/shirok/Gauche-www-cgi-throttle) for WiLiKi site
to enable rate control.

WiLiKi is for small to moderate sites, and is written with simplicity
over scalability.  However, when you run public sites, sometimes
ill-behaving scapers come and bang the server.  Cgi-throttle monitors
the access and exit early returning 503.

With this module you can just replace `wiliki-main` with
`wiliki-main/throttle` and you can take advantage of cgi-throttle
feature.

To customize configuration, use the parameters of cgi-throttle,
`cgi-throttle-connection` and `cgi-throttle-config`.  You can leave
them alone if the default is suffice.

## Prerequisites

- [Gauche](https://practical-scheme.net/gauche)
- [WiLiKi](https://github.com/shirok/WiLiKi)
- [Gauche-www-cgi-throttle](https://github.com/shirok/Gauche-www-cgi-throttle)
- [Gauche-memcache](https://github.com/tabe/Gauche-memcache) required by Gauche-www-cgi-throttle

You also need to run membached on the server.

See [package.scm](package.scm) for minimal versions of required
packages.

## Simple usage

A typical wiliki main cgi code looks like this:

```
(use wiliki)

...

(define (main args)
  (wiliki-main
    (make <wiliki>
      ...)))
```

You can import `wiliki.cgi-throttle` and replace `wiliki-main`
with `wiliki-main/cgi-throttle`, and that's it.  If the cgi
script gets too many requests from the same IP, `wiliki-main/cgi-throttle`
returns 503 instead of passing control to WiLiKi routine.

```
(use wiliki)
(use wiliki.cgi-throttle)

...

(define (main args)
  (wiliki-main/cgi-throttle
    (make <wiliki>
      ...)))
```

## Delaying loading wiliki

If the scraper is banging your site, you want to reject it
as lightly as possible.  Loading `wiliki` module itself taxes
the server.  You can set autoload on `wiliki` module so that
it won't be loaded if cgi-throttle decided not to serve the client.

```
(use wiliki.cgi-throttle)

(autoload wiliki <wiliki>)

...

(define (main args)
  (wiliki-main/cgi-throttle
    (make <wiliki>
      ...)))
```

Note that if you refer to other wiliki API in the script,
you need to list it in the autoload.

## Customizing behavior

The criteria to trigger throttle, and how to handle exessive access,
can be customized with the parameter `cgi-throttle-config`.

The connection to the memcached can be specified by the parameter
`cgi-throttle-connection`.

Both are defined in `www.cgi.throttle`
and reexported from  `wiliki.cgi-throttle` for the convenience.
See the documentation of
[www.cgi.throttle](https://github.com/shirok/Gauche-www-cgi-throttle),
for the details.
