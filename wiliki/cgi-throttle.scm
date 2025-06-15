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

;; We delay evaluation of instance generation, so that we can avoid
;; loading wiliki when cgi-throttle rejects service.
(define-syntax wiliki-main/throttle
  (syntax-rules ()
    [(_ wiliki-instance)
     (%wiliki-main/throttle (lambda () wiliki-instance))]))

(define (%wiliki-main/throttle thunk)
  (cgi-throttle
   (cgi-throttle-connection)
   (cgi-throttle-config)
   (^[]
     (let* ([wiliki-main-proc wiliki-main] ;ensures wiliki is autoloaded here
            [wiliki-instance (thunk)])
       (wiliki-main-proc wiliki-instance)))))
