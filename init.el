
;; Keep Custom settings in a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Auto-save files
(auto-save-visited-mode 1)

;; For faster rendering on Windows. Fuck Windows.
(setq inhibit-compacting-font-caches t)

;; Disable scroll bar
(scroll-bar-mode -1)

(defface egoge-display-time
  '((((type x w32 mac))
     (:foreground "#FD971F" :inherit bold))
    (((type tty))
     (:foreground "orange")))
  "Face used to display the time in the mode line.")

;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
(setq display-time-string-forms
      '((propertize (concat " [" 24-hours ":" minutes "] ")
 		    'face 'egoge-display-time)))
(display-time-mode 1)

;; Replace selection by typing
(delete-selection-mode 1)

;; Auto-update buffers when they were modified externally
(global-auto-revert-mode t)
;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)
;; Auto-update remote files
(setq auto-revert-remote-files t)

;; Start maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray20")

(setq-default cursor-type 'bar)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Define tab stop at ever 4'th column
(setq tab-stop-list (number-sequence 4 120 4))

;; Move between windows with shift-arrows
(windmove-default-keybindings)

;; Load additional packages from .emacs.d/
(add-to-list 'load-path "~/.emacs.d/packages/")

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

;; Macros
(load-file "~/.emacs.d/macros.el")

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
  :bind
  ("M-S-<up>" . move-text-up)
  ("M-S-<down>" . move-text-down))

(use-package avy
  :bind
  ("C-;"   . avy-goto-char)
  ("C-'"   . avy-goto-char-2)
  ("M-g f" . avy-goto-line))

(defun avy-go-after-char (c)
    (interactive "cchar:")
    (avy-goto-char c)
    (forward-char))

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

(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-whitelist '("projectile")))

(defun kb-scroll-up-hold-cursor ()
  "Scroll up one position in file."
  (interactive)
  (scroll-up-command 1))

(defun kb-scroll-down-hold-cursor ()
  "Scroll down one position in file."
  (interactive)
  (scroll-up-command -1))

(defun kb-scroll-up ()
  "Scroll up one position in file, move cursor with the scroll."
  (interactive)
  (scroll-up-command -1)
  (forward-line -1))

(defun kb-scroll-down ()
  "Scroll down one position in file, move cursor with the scroll."
  (interactive)
  (scroll-up-command 1)
  (forward-line 1))

(bind-key (kbd "M-p") 'kb-scroll-up)
(bind-key (kbd "M-n") 'kb-scroll-down)

(use-package symbol-overlay
  :load-path "~/.emacs.d/packages/symbol-overlay"
  ;;:hook
  ;;(prog-mode . symbol-overlay-mode)
  :bind
  ("M-i" . symbol-overlay-put)
  ("<f7>" . symbol-overlay-mode)
  ("<f8>" . symbol-overlay-remove-all))

(setq default-text-properties '(line-height 1.15))

;; Try to guess target directory
(setq dired-dwim-target t)

(use-package impatient-mode)

(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

(use-package all-the-icons)
(use-package shrink-path)

(use-package doom-modeline
  :after all-the-icons shrink-path
  :load-path "~/.emacs.d/packages/doom-modeline"
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon nil)
  (setq doom-modeline-height 0)
  (setq doom-modeline-vcs-max-length 30)
  (setq doom-modeline-buffer-file-name-style 'buffer-name)
  (setq find-file-visit-truename t))

;; Use Flycheck
(use-package flycheck
  :bind
  ("C-M-=" . flycheck-buffer)
  :config
  (setq flycheck-checker-error-threshold 2000))

(use-package nyan-mode
  :config
  (nyan-mode 1))

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))
