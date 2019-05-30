(defface egoge-display-time
  '((((type x w32 mac))
     (:foreground "#FD971F" :inherit bold))
    (((type tty))
     (:foreground "orange")))
  "Face used to display the time in the mode line.")

;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
(setq display-time-string-forms
      '((concat
         (propertize "\xf017" 'face '(:foreground "#FD971F" :family "FontAwesome"))
         (propertize (concat " " 24-hours ":" minutes " | week" (format-time-string "%y%V"))
                     'face 'egoge-display-time))))
(display-time-mode 1)


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

(use-package nyan-mode
  :config
  (nyan-mode 1))

(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-whitelist '("projectile")))


