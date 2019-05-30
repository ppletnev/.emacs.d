(use-package key-chord
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.05)
  (setq key-chord-one-key-delay 0.0)
  (key-chord-define-global "l;" 'avy-goto-char)
  (key-chord-define-global ";'" 'avy-go-after-char)
  (key-chord-define-global "xc" (kbd "C-w C-y"))
  (key-chord-define-global "sx" (kbd "C-a C-k C-y"))
  (key-chord-define-global "zx" (kbd "C-a C-k C-k"))
  (key-chord-define-global "gb" 'avy-goto-line)
  (key-chord-define-global "dc" (kbd "C-a C-SPC C-n M-w C-y C-p C-e"))
  (key-chord-define-global "as" (kbd "C-x C-s")))
