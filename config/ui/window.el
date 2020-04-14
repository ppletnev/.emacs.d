
;; Disable scroll bar
(scroll-bar-mode -1)

;; Disable menu-bar (bar with minor modes above)
(menu-bar-mode -1)

;; Remove tool bar
(tool-bar-mode -1)

;; Start maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Smooth scrolling
(setq auto-window-vscroll nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "*")
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
