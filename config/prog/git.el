(use-package magit
  :bind
  ("C-x g" . magit-status))

;; Show git changes in gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:added-sign " ")
  (setq git-gutter:deleted-sign " ")
  (setq git-gutter:modified-sign " "))
