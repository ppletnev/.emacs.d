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
    ("8c803a72b3300c78d356bd5ca33aae43bbfc5fa3986aa83582bd1c11794e1cac" default)))
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:modified-sign " ")
 '(lsp-prefer-flymake nil)
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (nyan-mode all-the-icons impatient-mode flymd symbol-overlay org-bullets jabber sml projectile-ripgrep diminish rich-minority modalka yascroll rainbow-delimiters zoom yasnippet markdown-mode spinner ht dash-functional f expand-region smartparens move-text restclient column-enforce-mode magit treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs use-package lsp-ui hydra)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
