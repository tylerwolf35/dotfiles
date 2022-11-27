;; line numbers
(global-display-line-numbers-mode)

;; close pairs
(electric-pair-mode)

(tool-bar-mode)

;; change backup directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; font
(add-to-list 'default-frame-alist '(font . "Iosevka Term 12"))
;;(set-frame-font "Iosevka Term 12" nil t)

;; icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; Enable Evil
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
(evil-set-undo-system 'undo-redo)
(when (require 'evil-collection nil t)
  (evil-collection-init))

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; jump
(require 'avy)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; autocompletion
(add-hook 'after-init-hook 'global-company-mode)

;; lsp
(require 'lsp)

;; pdf-tools
(pdf-loader-install)

;; mastodon
(setq mastodon-instance-url "https://freeradical.zone"
      mastodon-active-user "tylerwolf")

;; engine-mode
(require 'engine-mode)
(engine-mode t)
(defengine google
  "https://www.google.com/search?q=%s"
  :keybinding "g")

;; mail
(setq user-mail-address "tyler@twolf.io")
(setq user-full-name "Tyler Wolf")

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "127.0.0.1"
      smtpmail-smtp-server "127.0.0.1"
      smtpmail-smtp-service 1025
      smtpmail-debug-info t)
