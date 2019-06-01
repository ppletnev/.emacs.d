;; Highlight symbols after certain column
(use-package column-enforce-mode
  :config
  (setq column-enforce-column 120)
  :hook (c-mode c++-mode))

;; Set indent to 4 columns
(setq c-basic-offset 4)

(setq c-default-style "bsd")

(defvar c-mode-font-lock-suffix-regex (concat
                                       "\\<[a-z_][a-z0-9_]*_" ; start of the variable
                                       "\\(" ; suffix start
                                       "\\(?:u\\|si\\)\\(?:8\\|16\\|32\\|64\\)f?" ; type suffix
                                       "\\|"
                                       "cm\\|mm\\|km\\|kmph\\|cmph\\|[0-9]+th[a-z]+" ; units suffix
                                       "\\|"
                                       "[0-9]?\\(?:u\\|n\\|m\\)s" ; time suffix
                                       "\\)" ; suffix end
                                       "\\>" ; variable end
                                       ))

(add-hook 'c-mode-hook (lambda () (setq c-font-lock-extra-types
                                        (append c-font-lock-extra-types (list "\\(?:u|si\\)\\(?:8|16|32|64\\)"
                                                                              "bool_T")))))

(add-hook
 'c-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    `( ;; Highlight units or hungarian notation on variables 
      (,c-mode-font-lock-suffix-regex 1 font-lock-variable-name-face keep)
      ;; TRUE/FALSE constants
      ("\\<\\(FALSE\\|TRUE\\|ERRT_ASSERT\\|ERRT_LOW\\|ERRT_HIGH\\|ERRT_INFO\\)\\>" 1 font-lock-constant-face keep)
      ;; float constants
      ("\\<\\([0-9]+\\.[0-9]*[fF]?\\)\\>" 1 font-lock-constant-face keep) 
      ;; binary constants
      ("\\<\\(0b[01]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep)
      ;; hex constants
      ("\\<\\(0x[0-9A-F]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep)
      ;; numeric constants
      ("\\<\\([0-9]+\\(?:U\\|UL\\|L\\|ULL\\|LL\\)?\\)\\>" 1 font-lock-constant-face keep)
      ("\\<\\(if\\|switch\\|return\\|for\\|while\\|sizeof\\)\\>" 1 font-lock-keyword-face keep)
      ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>\\s *(" 1 font-lock-function-name-face keep)
      ("\\(+\\|-\\|=\\|&\\||\\|%\\|*\\|!\\|>\\|<\\|~\\|\\^\\|/\\|\\.\\|?\\|:\\)" 1 font-lock-keyword-face keep)
      ))))

