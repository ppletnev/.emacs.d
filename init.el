
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; For faster rendering on Windows. Fuck Windows.
(setq inhibit-compacting-font-caches t)


(setq-default cursor-type 'bar)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Move between windows with shift-arrows
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
  (c++mode . lsp)
  :config
  (setq lsp-enable-snippet nil))

(use-package company-lsp
  :after lsp-mode
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-enable-snippet nil))

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
 '(mac-command-modifier (quote control))
 '(mac-option-modifier (quote meta))
 '(package-selected-packages
   (quote
    (yascroll rainbow-delimiters zoom yasnippet markdown-mode spinner ht dash-functional f expand-region smartparens move-text restclient column-enforce-mode magit treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs use-package lsp-ui hydra)))
 '(show-paren-mode t))


;; Windows
(if (eq system-type 'windows-nt)
    (progn (set-frame-font "Consolas 11" nil t))
)

;; OS X
(if (eq system-type 'darwin)
  (set-frame-font "Consolas 14" nil t)
)

;; Smooth scrolling on Windows
(setq auto-window-vscroll nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq lsp-clients-clangd-executable "/usr/local/Cellar/llvm/8.0.0/bin/clangd")


(add-hook
 'c-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    '(
      ("\\<\\([0-9]+\\.[0-9]*[fF]?\\)\\>" 1 font-lock-constant-face keep) ;; float constants
      ("\\<\\(0b[01]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; binary constants
      ("\\<\\(0x[0-9A-F]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; hex constants
      ("\\<\\([0-9]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; numeric constants
      ("\\<\\(if\\|switch\\|return\\|for\\|while\\|sizeof\\)\\>" 1 font-lock-keyword-face keep)
      ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>\\s *(" 1 font-lock-function-name-face keep)
      ("\\(+\\|-\\|=\\|&\\||\\|%\\|*\\|!\\|>\\|<\\|~\\|\\^\\|/\\|\\.\\|?\\|:\\)" 1 font-lock-keyword-face keep)
      ))))

(savehist-mode 1)

(load-file "~/.emacs.d/treemacs_cfg.el")

;; Settings for C language
(load-file "~/.emacs.d/c_lang.el")

;; Org-mode settings
(load-file "~/.emacs.d/cfg_org.el")

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
 
(add-to-list 'load-path "~/.emacs.d/packages/multiple-cursors.el/")
(use-package multiple-cursors
  :ensure nil
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

;; Package for interactive REST API testing
(use-package restclient)

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package avy
  :bind
  ("C-;"   . avy-goto-char)
  ("C-'"   . avy-goto-char-2)
  ("M-g f" . avy-goto-line))
  
;; Parens magic
(use-package smartparens
  :config
  (smartparens-global-mode t))

;; Expand selection
(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Remove tool bar
(tool-bar-mode -1)

;; Remove cygwin warnings in Windows
(setenv "CYGWIN" "nodosfilewarning")
