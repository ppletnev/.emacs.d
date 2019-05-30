(use-package magit
  :bind
  ("C-x g" . magit-status))

;; Show git changes in gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t))
