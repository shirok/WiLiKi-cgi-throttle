;;
;; Package WiLiKi-cgi-throttle
;;

(define-gauche-package "WiLiKi-cgi-throttle"
  ;; Repository URL, e.g. github
  ;;  This URL uniquely identifies the package.
  :repository "http://github.com/shirok/WiLiKi-cgi-throttle.git"

  ;;
  :version "0.1"

  ;; Description of the package.  The first line is used as a short
  ;; summary.
  :description "WiLiKi + cgi-throttle add-on\
              \nThis module provides an easy API to add access rate control\
              \nto WiLiKi."

  ;; List of dependencies.
  ;; Example:
  ;;     :require (("Gauche" (>= "0.9.5"))  ; requires Gauche 0.9.5 or later
  ;;               ("Gauche-gl" "0.6"))     ; and Gauche-gl 0.6
  :require (("Gauche" (>= "0.9.15"))
            ("WiLiKi" (>= "0.8.3"))
            ("Gauche-www-cgi-throttle" (>= "0.2.2_pre1")))

  ;; List of providing modules
  ;; NB: This will be recognized >= Gauche 0.9.7.
  ;; Example:
  ;;      :providing-modules (util.algorithm1 util.algorithm1.option)
  :providing-modules (wiliki.cgi-throttle)

  ;; List name and contact info of authors.
  ;; e.g. ("Eva Lu Ator <eval@example.com>"
  ;;       "Alyssa P. Hacker <lisper@example.com>")
  :authors ("Shiro Kawai <shiro@acm.org>")

  ;; List name and contact info of package maintainers, if they differ
  ;; from authors.
  ;; e.g. ("Cy D. Fect <c@example.com>")
  :maintainers ()

  ;; List licenses
  ;; e.g. ("BSD")
  :licenses ("MIT")

  ;; Homepage URL, if any.
  ; :homepage "http://example.com/WiLiKi-cgi-throttle/"
  )
