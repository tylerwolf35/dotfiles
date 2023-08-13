;; Personal Information
(setq user-full-name "Tyler Wolf"
      user-mail-address "tylerwolf@posteo.net")

;; IMAP
(setq gnus-select-method '(nnimap "posteo.de"))

;; SMTP
(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "posteo.de"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl)

;; Sent folder
(setq gnus-message-archive-method '(nnimap "posteo.de")
       gnus-message-archive-group "Sent")

;; auto-complete emacs address using bbdb command, optional
(add-hook 'message-mode-hook
          '(lambda ()
             (flyspell-mode t)
             (local-set-key (kbd "TAB") 'bbdb-complete-name)))
;; }}

;; ask encryption password once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date
        (not gnus-thread-sort-by-number)))

; NO 'passive
(setq gnus-use-cache t)

;; {{ press "o" to view all groups
(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5))

(define-key gnus-group-mode-map
  ;; list all the subscribed groups even they contain zero un-read messages
  (kbd "o") 'my-gnus-group-list-subscribed-groups)
;; }}

;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
(setq gnus-use-correct-string-widths nil)
