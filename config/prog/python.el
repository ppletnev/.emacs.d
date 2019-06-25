(add-hook
 'python-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    `(;; float constants
      ("\\<\\([0-9]+\\.[0-9]*\\)\\>" 1 font-lock-constant-face keep)
      ("\\<\\(if\\|return\\|for\\|while\\)\\>" 1 font-lock-keyword-face keep)
      ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>\\s *(" 1 font-lock-function-name-face keep)
      ("\\(+\\|-\\|=\\|&\\||\\|%\\|*\\|!\\|>\\|<\\|~\\|\\^\\|/\\|\\.\\|?\\|:\\)" 1 font-lock-keyword-face keep)
      ;; hex constants
      ("\\<\\(0x[0-9A-F]+\\)\\>" 1 font-lock-constant-face keep)
      ;; binary constants
      ("\\<\\(0b[01]+\\)\\>" 1 font-lock-constant-face keep)
      ;; numeric constants
      ("\\<\\([0-9]+\\)\\>" 1 font-lock-constant-face keep)
      ))))
