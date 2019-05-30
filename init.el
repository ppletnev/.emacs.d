
;; Keep Custom settings in a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Start maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Load additional packages from .emacs.d/
(add-to-list 'load-path "~/.emacs.d/packages/")

(defvar cfg-custom-pkg-load-path "~/.emacs.d/packages/")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Ensure that use-package is loaded
(unless (package-installed-p 'use-package)
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

;; Smooth scrolling on Windows
(setq auto-window-vscroll nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq lsp-clients-clangd-executable "/usr/local/Cellar/llvm/8.0.0/bin/clangd")

(savehist-mode 1)

;; (byte-recompile-directory "~/.emacs.d/config" 0)

(dolist (file (directory-files-recursively "~/.emacs.d/config" "[a-zA-Z0-9\\-_]+\\.el"))
        (load file))

;; Highlight symbols after certain column
(use-package column-enforce-mode
  :config
  (setq column-enforce-column 120)
  :hook (c-mode c++-mode))

;; Show git changes in gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

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
  :bind
  ("M-S-<up>" . move-text-up)
  ("M-S-<down>" . move-text-down))

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

(use-package modalka
  :after key-chord
  :config
  ;;(key-chord-define-global ",." 'modalka-mode)
  (modalka-define-kbd "W" "M-w")
  (modalka-define-kbd "Y" "M-y")
  (modalka-define-kbd "a" "C-a")
  (modalka-define-kbd "b" "C-b")
  (modalka-define-kbd "B" "M-b")
  (modalka-define-kbd "e" "C-e")
  (modalka-define-kbd "f" "C-f")
  (modalka-define-kbd "F" "M-f")
  (modalka-define-kbd "g" "C-g")
  (modalka-define-kbd "n" "C-n")
  (modalka-define-kbd "p" "C-p")
  (modalka-define-kbd "w" "C-w")
  (modalka-define-kbd "k" "C-k")
  (modalka-define-kbd "y" "C-y")
  (modalka-define-kbd ";" "C-;")
  (modalka-define-kbd "'" "C-'")
  (modalka-define-kbd "v" "C-v")
  (modalka-define-kbd "V" "M-v")
  (modalka-define-kbd "l" "C-l")
  (modalka-define-kbd "s" "C-s")
  (modalka-define-kbd "S" "M-s")
  (modalka-define-kbd "=" "C-=")
  (modalka-define-kbd "/" "C-/")
  (modalka-define-kbd "SPC" "C-SPC"))

(use-package key-chord
  :after avy
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.05)
  (setq key-chord-one-key-delay 0.0)
  (key-chord-define-global "l;" 'avy-goto-char)
  (key-chord-define-global ";'" 'avy-go-after-char)
  (key-chord-define-global "xc" (kbd "C-w C-y"))
  (key-chord-define-global "sx" (kbd "C-a C-k C-y"))
  (key-chord-define-global "zx" (kbd "C-a C-k C-k"))
  (key-chord-define-global "gb" 'avy-goto-line)
  (key-chord-define-global "dc" (kbd "C-a C-SPC C-n M-w C-y C-p C-e"))
  (key-chord-define-global "as" (kbd "C-x C-s"))
  )

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package projectile-ripgrep
  :after projectile)

(use-package symbol-overlay
  :load-path "~/.emacs.d/packages/symbol-overlay"
  ;;:hook
  ;;(prog-mode . symbol-overlay-mode)
  :bind
  ("M-i" . symbol-overlay-put)
  ("<f7>" . symbol-overlay-mode)
  ("<f8>" . symbol-overlay-remove-all))


;; Try to guess target directory
(setq dired-dwim-target t)

(use-package impatient-mode)

(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

;; Use Flycheck
(use-package flycheck
  :bind
  ("C-M-=" . flycheck-buffer)
  :config
  (setq flycheck-checker-error-threshold 2000))

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))
