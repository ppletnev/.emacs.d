
(defun my/re-symbol-group (wrapped-string)
  (concat "\\_<\\(" wrapped-string "\\)\\_>"))

(add-hook
 'python-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    (list
     ;; float constants
     (list (my/re-symbol-group "[0-9]+\\.[0-9]*") 1 'font-lock-constant-face 'keep)
     ;; python keywords that can be interpreted as func call
     (list (concat (my/re-symbol-group (string-join '("if" "while" "return" "or" "and" "range" "len" "else" "elif" "int" "str" "float" "assert")
                                                  "\\|"))
               "\\s *(")
           1 'font-lock-keyword-face 'keep)
     ;; class definition
     (list (concat "class\\s *" (my/re-symbol-group "[_a-zA-Z][_a-zA-Z0-9]*") "\\s *(") 1 'font-lock-type-face 'keep)
     ;; function calls
     (list (concat (my/re-symbol-group "[_a-zA-Z][_a-zA-Z0-9]*") "\\s *(") 1 'font-lock-function-name-face 'keep)
     ;; common symbols to be colored
     (list (concat "\\("
               (string-join '("+" "-" "=" "&" "|" "%" "*" "!" ">" "<" "~" "\\^" "/" "\\." "?" ":")
                            "\\|")
               "\\)")
           1 'font-lock-keyword-face 'keep)
     ;; hex constants
     (list (my/re-symbol-group "0x[0-9A-F]+") 1 'font-lock-constant-face 'keep)
     ;; binary constants
     (list (my/re-symbol-group "0b[01]+") 1 'font-lock-constant-face 'keep)
     ;; numeric constants
     (list (my/re-symbol-group "[0-9]+") 1 'font-lock-constant-face 'keep)))))
