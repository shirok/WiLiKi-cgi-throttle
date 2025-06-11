#!/usr/bin/env gosh
;;
;; Test CGI
;;

(use wiliki)
(add-load-path "." :relative)
(use wiliki.cgi-throttle)

(define (main args)
  (wiliki-main/throttle
   (make <wiliki>
     :db-path "./test.dbm"
     :top-page "WiLiKi"
     :title "MyWiliki"
     )))
