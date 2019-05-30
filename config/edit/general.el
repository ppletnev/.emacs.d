;; No tabs
(setq-default indent-tabs-mode nil)

;; Define tab stop at every 4'th column
(setq tab-stop-list (number-sequence 4 120 4))

;; Replace selection by typing
(delete-selection-mode 1)

;; Auto-save files
(auto-save-visited-mode 1)

;; Auto-update buffers when they were modified externally
(global-auto-revert-mode t)
;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)
;; Auto-update remote files
(setq auto-revert-remote-files t)

