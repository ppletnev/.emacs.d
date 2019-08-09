(use-package move-text
  :bind
  ("M-S-<up>" . move-text-up)
  ("M-S-<down>" . move-text-down))

;; Expand selection
(use-package expand-region
  :bind
  ("C-=" . er/expand-region)
  ("C--" . (lambda () (interactive) (er/expand-region -1)))
  ("C-0" . (lambda () (interactive) (er/expand-region 0))))

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
  ("C-c C-<" . mc/mark-all-like-this)
  ("<mouse-3>" . mc/add-cursor-on-click))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))
