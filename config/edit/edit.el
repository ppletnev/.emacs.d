(use-package move-text
  :bind
  ("M-S-<up>" . move-text-up)
  ("M-S-<down>" . move-text-down))

;; Expand selection
(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

;; Parens magic
(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package multiple-cursors
  :ensure nil
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))
