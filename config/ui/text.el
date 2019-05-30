
;; For faster rendering on Windows. Fuck Windows.
(setq inhibit-compacting-font-caches t)

(if (eq system-type 'windows-nt)
    ;; Windows
    (set-frame-font "Consolas 11" nil t)
  ;; OS X and others
  (set-frame-font "Consolas 14" nil t))
  
;; Set height a liitle bigger so that there is an extra pixel above the text on selection
(setq default-text-properties '(line-height 1.15))

(use-package all-the-icons)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray20")

(setq-default cursor-type 'bar)

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package symbol-overlay
  :ensure nil
  ;;:hook
  ;;(prog-mode . symbol-overlay-mode)
  :bind
  ("M-i" . symbol-overlay-put)
  ("<f7>" . symbol-overlay-mode)
  ("<f8>" . symbol-overlay-remove-all))
