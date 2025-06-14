;;;
;;; wiliki_cgi_throttle
;;;

(define-module wiliki.cgi-throttle
  (use www.cgi.throttle)
  (export wiliki-main/throttle
          cgi-throttle-connection       ;re-export
          cgi-throttle-config))         ;re-export
(select-module wiliki.cgi-throttle)

(autoload wiliki wiliki-main)

;; Default to limit POST as well
(cgi-throttle-config
 `((POST :window 30 :count 10)
   (GET  :window 30 :count 15)))

(define (wiliki-main/throttle wiliki-instance)
  (cgi-throttle
   (cgi-throttle-connection)
   (cgi-throttle-config)
   (cut wiliki-main wiliki-instance)))
