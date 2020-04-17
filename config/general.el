;; Save history from previous sessions
(savehist-mode 1)

;; Undo tree with tree saving
(use-package undo-tree
  :load-path "~/.emacs.d/packages/undo-tree"
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs_undo_tree_saves"))))

;; Place backup files in separate dir
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;; Make backups by copying, may be slow
(setq backup-by-copying t)

;; Keep many backups of the same file
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; 20 MB limit for GC
(setq gc-cons-threshold 20000000)
