;;;
;;; Test wiliki.cgi-throttle
;;;

(use gauche.test)

(test-start "wiliki.cgi-throttle")
(use wiliki.cgi-throttle)
(test-module 'wiliki.cgi-throttle)

(use wiliki)
(use www.cgi.test)
(use sxml.sxpath)

;; Just ensure wiliki-main/throttle won't break things
(test* "" '((h1 "WiLiKi"))
       ((sxpath '(// body h1))
        (values-ref
         (run-cgi-script->sxml "./testcgi.scm")
         1)))

(test-end :exit-on-failure #t)
