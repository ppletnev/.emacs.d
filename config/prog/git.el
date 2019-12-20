(use-package magit
  :bind
  ("C-x g" . magit-status))

;; Show git changes in gutter
(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :bind
  ("C-c u" . git-gutter:revert-hunk)
  ("C-c v" . git-gutter:popup-hunk)
  :config
  (setq git-gutter:added-sign " ")
  (setq git-gutter:deleted-sign " ")
  (setq git-gutter:modified-sign " "))
