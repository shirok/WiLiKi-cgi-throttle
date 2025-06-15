#!/usr/bin/env gosh
;;
;; Test CGI
;;

(add-load-path "." :relative)
(use wiliki.cgi-throttle)

(autoload wiliki <wiliki>)

(define (main args)
  (wiliki-main/throttle
   (make <wiliki>
     :db-path "./test.dbm"
     :top-page "WiLiKi"
     :title "MyWiliki"
     )))
