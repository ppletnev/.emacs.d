
;; Try to guess target directory
(setq dired-dwim-target t)

;; Open directories as subtrees in current buffer
(use-package dired-subtree
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

;; allow dired to delete or copy dir
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

;; Hide additional file info by default
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; (use-package dired-du
;;   :config
;;   (add-hook 'dired-hide-details-mode-hook (lambda () (if (eq dired-hide-details-mode nil)
;;                                                          (dired-du-mode +1)
;;                                                        (dired-du-mode -1))))
;;   ;; Use human-readable size format
;;   (setq dired-du-size-format t))
