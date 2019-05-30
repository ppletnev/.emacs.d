;; Highlight symbols after certain column
(use-package column-enforce-mode
  :config
  (setq column-enforce-column 120)
  :hook (c-mode c++-mode))

;; Set indent to 4 columns
(setq c-basic-offset 4)

(setq c-default-style "bsd")

(add-hook
 'c-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    '(
      ("\\<\\([0-9]+\\.[0-9]*[fF]?\\)\\>" 1 font-lock-constant-face keep) ;; float constants
      ("\\<\\(0b[01]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; binary constants
      ("\\<\\(0x[0-9A-F]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; hex constants
      ("\\<\\([0-9]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep) ;; numeric constants
      ("\\<\\(if\\|switch\\|return\\|for\\|while\\|sizeof\\)\\>" 1 font-lock-keyword-face keep)
      ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>\\s *(" 1 font-lock-function-name-face keep)
      ("\\(+\\|-\\|=\\|&\\||\\|%\\|*\\|!\\|>\\|<\\|~\\|\\^\\|/\\|\\.\\|?\\|:\\)" 1 font-lock-keyword-face keep)
      ))))

