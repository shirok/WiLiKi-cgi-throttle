# WiLiKi and cgi-throttle brdige

This module makes it easy to adopt [cgi-throttle](https://github.com/shirok/Gauche-www-cgi-throttle) for WiLiKi site
to enable rate control.

WiLiKi for small to moderate sites, and is written with simplicity
over scalability.  However, when you run public sites, sometimes
ill-behaving scapers come and bang the server.  Cgi-throttle monitors
the access and exit early returning 503.

With this module you can just replace `wiliki-main` with
`wiliki-main/throttle` and you can take advantage of cgi-throttle
feature.

To customize configuration, use the parameters of cgi-throttle,
`cgi-throttle-connection` and `cgi-throttle-config`.  You can leave
them alone if the default is suffice.
