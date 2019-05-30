
;; Disable scroll bar
(scroll-bar-mode -1)

;; Start maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Remove tool bar
(tool-bar-mode -1)

;; Smooth scrolling on Windows
(setq auto-window-vscroll nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)
