;; Save history from previous sessions
(savehist-mode 1)

;; Place backup files in separate dir
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;; Make backups by copying, may be slow
(setq backup-by-copying t)

;; Keep many backups of the same file
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

