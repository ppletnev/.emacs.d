
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
