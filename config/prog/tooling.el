(use-package lsp-mode
  :config
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-rust-server 'rls)
  (setq lsp-eldoc-render-all nil)
  (setq lsp-idle-delay 0.600))

(use-package company-lsp
  :after lsp-mode
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet nil))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-doc-alignment 'frame)
  (setq lsp-ui-doc-delay 1.5))

(setq lsp-clients-clangd-executable "/usr/local/Cellar/llvm/8.0.0/bin/clangd")

;; Use Flycheck
(use-package flycheck
  :bind
  ("C-M-=" . flycheck-buffer)
  :config
  (setq flycheck-checker-error-threshold 2000))
