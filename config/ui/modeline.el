(defface egoge-display-time
  '((((type x w32 mac))
     (:foreground "#FD971F" :inherit bold))
    (((type tty))
     (:foreground "orange")))
  "Face used to display the time in the mode line.")


(setq display-time-string-forms
      '((concat (propertize "\xf017" 'face `(:foreground ,monokai-cyan :family "FontAwesome"))
                (propertize (format-time-string " %H:%M | w%y%V") 'face `(:foreground ,monokai-cyan)))))

(display-time-mode 1)


(use-package shrink-path)
(use-package doom-modeline
  :after all-the-icons shrink-path
  :load-path "~/.emacs.d/packages/doom-modeline"
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-minor-modes t) 
  (setq doom-modeline-icon t)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-height 0)
  (setq doom-modeline-env-version nil)
  (setq doom-modeline-vcs-max-length 30)
  (setq doom-modeline-buffer-file-name-style 'buffer-name)
  (setq find-file-visit-truename t))

(use-package nyan-mode
  :config
  (nyan-mode 0))

;; (use-package rich-minority
;;   :config
;;   (rich-minority-mode 1)
;;   (setq rm-whitelist '("projectile", "eyebrowse-mode")))

(use-package minions
  :config
  (setq minions-mode-whitelist '((eyebrowse-mode . nil)))
  (minions-mode 1))

