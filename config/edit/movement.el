
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        (t . ivy--regex-plus))))

(use-package counsel)

(use-package ivy-rich
  :after (ivy counsel)
  :config
  (ivy-rich-mode 1)
  (setq ivy-format-function #'ivy-format-function-line))

(use-package swiper
  :after ivy
  :bind
  ("C-s" . swiper))

(use-package avy
  :bind
  ("C-;"   . avy-goto-char)
  ("C-'"   . avy-goto-char-2)
  ("M-g f" . avy-goto-line))

(defun avy-go-after-char (c)
    (interactive "cchar:")
    (avy-goto-char c)
    (forward-char))


;; Switch buffers
(use-package buffer-move
  :bind
  ("<C-S-up>"    . buf-move-up)
  ("<C-S-down>"  . buf-move-down)
  ("<C-S-left>"  . buf-move-left)
  ("<C-S-right>" . buf-move-right))

;; Move between windows with shift-arrows
(windmove-default-keybindings)

;; Move between frames just like between windows
(use-package framemove
  :ensure nil
  :config
  (setq framemove-hook-into-windmove t))

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
