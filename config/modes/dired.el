
;; Try to guess target directory
(setq dired-dwim-target t)

;; Open directories as subtrees in current buffer
(use-package dired-subtree
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))
