;;;
;;; Test wiliki.cgi-throttle
;;;

(use gauche.test)

(test-start "wiliki.cgi-throttle")
(use wiliki.cgi-throttle)
(test-module 'wiliki.cgi-throttle)

(test-end :exit-on-failure #t)
