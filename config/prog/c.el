;; Highlight symbols after certain column
(use-package column-enforce-mode
  :config
  (setq column-enforce-column 120)
  :hook (c-mode c++-mode))

;; Set indent to 4 columns
(setq c-basic-offset 4)

;; Do not indent namespaces
(defun my-c-setup ()
  (c-set-offset 'innamespace [0]) ;; no indent in namespaces
  (c-set-offset 'inextern-lang [0]) ;; no indent for 'extern' blocks
  )
(add-hook 'c++-mode-hook 'my-c-setup)
(add-hook 'c-mode-hook 'my-c-setup)

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

(defun my/add-visual-replacement (from to)
  "Make `prettify-symbols-mode' replace string FROM with string TO.

Updates `prettify-symbols-alist'.  You may need to toggle
`prettify-symbols-mode' to make the changes take effect.

Each character of TO is vertically aligned using the baseline,
such that base-left of the character is aligned with base-right
of the preceding character.  Refer to `reference-point-alist'
for more information."
  (push (cons from (let ((composition nil))
                     (dolist (char (string-to-list to)
                                   (nreverse (cdr composition)))
                       (push char composition)
                       (push '(Br . Bl) composition))))
        prettify-symbols-alist))

(add-hook 'c-mode-hook
          (lambda ()
            (my/add-visual-replacement "FALSE !=" "TRUE ==")
            (my/add-visual-replacement "FALSE!=" "TRUE ==" )
            (my/add-visual-replacement "!= FALSE" "== TRUE")
            (my/add-visual-replacement "!=FALSE" "== TRUE")
            (prettify-symbols-mode)))

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
