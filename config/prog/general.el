
;; Snippets for common language structures autocomplete
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-indent-line 'fixed))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package dumb-jump
  :hook
  (prog-mode . dumb-jump-mode)
  :config
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-force-searcher 'rg))


;; OS X: ensure environment variables inside Emacs look the same as in the user's shell
(if (eq system-type 'darwin)
    (use-package exec-path-from-shell
      :config (exec-path-from-shell-initialize)))

(use-package aggressive-indent
  :hook
  (c-mode . aggressive-indent-mode)
  (c++-mode . aggressive-indent-mode))
