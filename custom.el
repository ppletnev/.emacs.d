;; Load themes from .emacs.d/
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001" default)))
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:modified-sign " ")
 '(lsp-prefer-flymake nil)
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(package-selected-packages
   (quote
    (org-bullets jabber sml projectile-ripgrep diminish rich-minority modalka yascroll rainbow-delimiters zoom yasnippet markdown-mode spinner ht dash-functional f expand-region smartparens move-text restclient column-enforce-mode magit treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs use-package lsp-ui hydra)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
