;;;
;;; Test wiliki.cgi-throttle
;;;

(use gauche.test)

(test-start "wiliki.cgi-throttle")
(use wiliki.cgi-throttle)
(test-module 'wiliki.cgi-throttle)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-wiliki_cgi_throttle" "wiliki_cgi_throttle is working"
       (test-wiliki_cgi_throttle))

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
