(setq mac-command-modifier (quote super))
(setq mac-option-modifier (quote meta))

(use-package key-chord
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.2)
  (setq key-chord-one-key-delay 0.0)
  (key-chord-define-global ";'" 'avy-goto-char-2)
  (key-chord-define-global "gb" 'avy-goto-line)
  (key-chord-define-global "dc" (kbd "C-a C-SPC C-n M-w C-y C-p C-e")))
