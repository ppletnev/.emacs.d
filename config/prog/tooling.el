(use-package lsp-mode
  ;; :hook
  ;; (c-mode . lsp)
  ;; (c++mode . lsp)
  :config
  (setq lsp-enable-snippet nil))

(use-package company-lsp
  :after lsp-mode
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet nil))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(setq lsp-clients-clangd-executable "/usr/local/Cellar/llvm/8.0.0/bin/clangd")

;; Use Flycheck
(use-package flycheck
  :bind
  ("C-M-=" . flycheck-buffer)
  :config
  (setq flycheck-checker-error-threshold 2000))
