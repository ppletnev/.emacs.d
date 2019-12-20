
;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable menu-bar (bar with minor modes above)
(menu-bar-mode -1)

;; Remove tool bar
(tool-bar-mode -1)

;; Start maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Smooth scrolling on Windows
;;(setq auto-window-vscroll nil)
;;(setq scroll-step 1)
;;(setq scroll-conservatively 10000)
;;(setq mouse-wheel-scroll-amount '(3))
;;(setq mouse-wheel-progressive-speed nil)

(use-package sublimity
  :hook (prog-mode . sublimity-mode)
  :config
  (require 'sublimity-scroll)
  (setq sublimity-scroll-weight 10
        sublimity-scroll-drift-length 6))
