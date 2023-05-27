(in-package #:nyxt-user)

;; web-buffer prompt-buffer
(define-configuration web-buffer
  ;; VI keybindings.
  ((default-modes `(nyxt/mode/vi:vi-normal-mode
                    #+nyxt-3 ,@%slot-value%
                    #+nyxt-2 ,@%slot-default%))))

;; This automatically darkens WebKit-native interfaces and sends the
;; "prefers-color-scheme: dark" to all the supporting websites.
(setf (uiop:getenv "GTK_THEME") "Adwaita:dark")

(define-configuration browser
  ((theme (make-instance
           'theme:theme
           :background-color "#1F1F28"
           :accent-color "#2D4F67"
           :primary-color "#DCD7BA"
           :secondary-color "#2A2A37"))))
