(use-package magit
  :bind
  ("C-x g" . magit-status)
  :config
  (if (eq system-type 'darwin)
      (setq magit-git-executable "/usr/bin/git"))
  (if (eq system-type 'windows-nt)
      (setq magit-git-executable "C:/Program Files (x86)/Git/bin/git.exe"))
  )


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
