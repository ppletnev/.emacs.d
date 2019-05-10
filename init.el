
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default cursor-type 'bar)

(windmove-default-keybindings)

;; Load additional packages from .emacs.d/
(add-to-list 'load-path "~/.emacs.d/packages/")

;; Load themes from .emacs.d/
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure that use-package is loaded
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-initialize)
  (package-install 'use-package))

(require 'use-package)

;; Make sure that package is always loaded from ELPA if not present
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Update outdated packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package lsp-mode
  :hook
  (c-mode . lsp)
  (c++mode . lsp))

(use-package company-lsp
  :after lsp-mode
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001" default)))
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:modified-sign " ")
 '(lsp-prefer-flymake nil)
 '(package-selected-packages
   (quote
    (move-text restclient multiple-cursors column-enforce-mode magit treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs use-package lsp-ui hydra)))
 '(show-paren-mode t))

(if (eq system-type 'darwin)
  (set-default-font "Consolas 14") ; OS X
  (set-default-font "Consolas 12") ; Others
)

(setq lsp-clients-clangd-executable "/usr/local/Cellar/llvm/8.0.0/bin/clangd")


(add-hook
 'c-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    '(
      ("\\<\\(\\(?:0x\\|0b\\|0o\\)?[0-9]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep)
      ("\\<\\(if\\|switch\\|return\\|for\\|while\\|sizeof\\)\\>" 1 font-lock-keyword-face keep)
      ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>\\s *(" 1 font-lock-function-name-face keep)
      ("\\(+\\|-\\|=\\|&\\||\\|%\\|*\\|!\\|>\\|<\\|~\\|\\^\\|/\\|\\.\\|?\\|:\\)" 1 font-lock-keyword-face keep)
      ))))

(savehist-mode 1)

(load-file "~/.emacs.d/treemacs_cfg.el")

;; Highlight symbols after certain column
(use-package column-enforce-mode
  :config
  (setq column-enforce-column 120)
  :hook (c-mode c++-mode))

;; Show git changes in gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;; Switch buffers
(use-package buffer-move
  :bind
  ("<C-S-up>"    . buf-move-up)
  ("<C-S-down>"  . buf-move-down)
  ("<C-S-left>"  . buf-move-left)
  ("<C-S-right>" . buf-move-right))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . mc/edit-lines))

;; Package for interactive REST API testing
(use-package restclient)

(use-package move-text
  :config
  (move-text-default-bindings)

  ;; Auto-indent when moving
  (defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
        (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))

  (advice-add 'move-text-up :after 'indent-region-advice)
  (advice-add 'move-text-down :after 'indent-region-advice))
