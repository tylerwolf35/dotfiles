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

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; meow
(require 'meow)
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
;; '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("/" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))
(meow-setup)
(meow-global-mode 1)

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
(setq user-mail-address "tylerwolf@posteo.net")
(setq user-full-name "Tyler Wolf")

(setq gnus-select-method
      '(nnimap "posteo.de"))

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "posteo.de"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; gnus-group-mode
(eval-after-load 'gnus-group
  '(progn
     (defhydra hydra-gnus-group (:color blue)
       "
[_A_] Remote groups (A A) [_g_] Refresh
[_L_] Local groups        [_\\^_] List servers
[_c_] Mark all read       [_m_] Compose new mail
[_G_] Search mails (G G) [_#_] Mark mail
"
       ("A" gnus-group-list-active)
       ("L" gnus-group-list-all-groups)
       ("c" gnus-topic-catchup-articles)
       ("G" dianyou-group-make-nnir-group)
       ("g" gnus-group-get-new-news)
       ("^" gnus-group-enter-server-mode)
       ("m" gnus-group-new-mail)
       ("#" gnus-topic-mark-topic)
       ("q" nil))
     ;; y is not used by default
     (define-key gnus-group-mode-map "y" 'hydra-gnus-group/body)))

;; gnus-summary-mode
(eval-after-load 'gnus-sum
  '(progn
     (defhydra hydra-gnus-summary (:color blue)
       "
[_s_] Show thread   [_F_] Forward (C-c C-f)
[_h_] Hide thread   [_e_] Resend (S D e)
[_n_] Refresh (/ N) [_r_] Reply
[_!_] Mail -> disk  [_R_] Reply with original
[_d_] Disk -> mail  [_w_] Reply all (S w)
[_c_] Read all      [_W_] Reply all with original (S W)
[_#_] Mark          [_G_] Search mails
"
       ("s" gnus-summary-show-thread)
       ("h" gnus-summary-hide-thread)
       ("n" gnus-summary-insert-new-articles)
       ("F" gnus-summary-mail-forward)
       ("!" gnus-summary-tick-article-forward)
       ("d" gnus-summary-put-mark-as-read-next)
       ("c" gnus-summary-catchup-and-exit)
       ("e" gnus-summary-resend-message-edit)
       ("R" gnus-summary-reply-with-original)
       ("r" gnus-summary-reply)
       ("W" gnus-summary-wide-reply-with-original)
       ("w" gnus-summary-wide-reply)
       ("#" gnus-topic-mark-topic)
       ("G" dianyou-group-make-nnir-group)
       ("q" nil))
     ;; y is not used by default
     (define-key gnus-summary-mode-map "y" 'hydra-gnus-summary/body)))

;; gnus-article-mode
(eval-after-load 'gnus-art
  '(progn
     (defhydra hydra-gnus-article (:color blue)
       "
[_o_] Save attachment        [_F_] Forward
[_v_] Play video/audio       [_r_] Reply
[_d_] CLI to download stream [_R_] Reply with original
[_b_] Open external browser  [_w_] Reply all (S w)
[_f_] Click link/button      [_W_] Reply all with original (S W)
[_g_] Focus link/button
"
       ("F" gnus-summary-mail-forward)
       ("r" gnus-article-reply)
       ("R" gnus-article-reply-with-original)
       ("w" gnus-article-wide-reply)
       ("W" gnus-article-wide-reply-with-original)
       ("o" gnus-mime-save-part)
       ("v" my-w3m-open-with-mplayer)
       ("d" my-w3m-download-rss-stream)
       ("b" my-w3m-open-link-or-image-or-url)
       ("f" w3m-lnum-follow)
       ("g" w3m-lnum-goto)
       ("q" nil))
     ;; y is not used by default
     (define-key gnus-article-mode-map "y" 'hydra-gnus-article/body)))

;; message-mode
(eval-after-load 'message
  '(progn
     (defhydra hydra-message (:color blue)
  "
[_c_] Complete mail address
[_a_] Attach file
[_s_] Send mail (C-c C-c)
"
       ("c" counsel-bbdb-complete-mail)
       ("a" mml-attach-file)
       ("s" message-send-and-exit)
       ("i" dianyou-insert-email-address-from-received-mails)
       ("q" nil))))

(defun message-mode-hook-hydra-setup ()
  (local-set-key (kbd "C-c C-y") 'hydra-message/body))
(add-hook 'message-mode-hook 'message-mode-hook-hydra-setup)

;; eaf
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
