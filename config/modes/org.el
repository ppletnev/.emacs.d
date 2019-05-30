(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Don't add timestamp when the task is done
(setq org-log-done nil)

(setq org-agenda-files (list "~/org/tickets.org"))

(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode))

;; Prevent editing folded area
(setq org-catch-invisible-edits 'error)

;; Hide empty lines between subtrees
(setq org-cycle-separator-lines 0)
