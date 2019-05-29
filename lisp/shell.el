(require 'dash)
(require 's)

;; Do not wrap long lines, just hide continuations
(add-hook 'eshell-mode-hook 'toggle-truncate-lines)

(setq eshell-directory-name "~")

;; Scroll to prompt on input, helps with large outputs
(setq eshell-scroll-to-bottom-on-input t)

(defmacro with-face (STR &rest PROPS)
  "Return STR propertized with PROPS."
  `(propertize ,STR 'face (list ,@PROPS)))

(defmacro esh-section (NAME ICON FORM &rest PROPS)
  "Build eshell section NAME with ICON prepended to evaled FORM with PROPS."
  `(setq ,NAME
         (lambda () (when ,FORM
                      (-> ,ICON
                          (concat esh-section-delim ,FORM)
                          (with-face ,@PROPS))))))

(defun esh-acc (acc x)
  "Accumulator for evaluating and concatenating esh-sections."
  (--if-let (funcall x)
      (if (s-blank? acc)
          it
        (concat acc esh-sep it))
    acc))

(defun esh-prompt-func ()
  "Build `eshell-prompt-function'"
  (concat esh-header
          (-reduce-from 'esh-acc "" eshell-funcs)
          "\n"
          eshell-prompt-string))


(defun git-prompt-branch-name ()
  "Get current git branch name"
  (let ((args '("symbolic-ref" "HEAD" "--short")))
    (with-temp-buffer
      (apply #'process-file "git" nil (list t nil) nil args)
      (unless (bobp)
        (goto-char (point-min))
        (buffer-substring-no-properties (point) (line-end-position))))))

;; Separator between esh-sections
(setq esh-sep (with-face " | " '(:foreground "gray")))  ; or " | "

;; Separator between an esh-section icon and form
(setq esh-section-delim " ")

;; Eshell prompt header
(setq esh-header (with-face "\n┌─ " '(:foreground "goldenrod1")))  ; or "\n┌─"

;; Eshell prompt regexp and string. Unless you are varying the prompt by eg.
;; your login, these can be the same.
(setq eshell-prompt-regexp (with-face "└─> " '(:foreground "goldenrod1")))   ; or "└─> "
(setq eshell-prompt-string (with-face "└─> " '(:foreground "goldenrod1")))   ; or "└─> "


;; (esh-section esh-dir
;;              (all-the-icons-faicon "folder");;(propertize "\xf07b" 'face '(:family "FontAwesome"))  ;  (faicon folder)
;;              (abbreviate-file-name (eshell/pwd))
;;              '(:foreground "gold" :bold ultra-bold :underline t))
(setq esh-dir (lambda () (concat (propertize "\xf07b " 'face '(:family "FontAwesome" :foreground "gold" :underline t))
                                 (propertize (abbreviate-file-name (eshell/pwd)) 'face '(:foreground "gold" :bold ultra-bold :underline t)))))

(setq esh-git (lambda () (concat (propertize "\xe907 " 'face '(:family "all-the-icons" :foreground "pink"))
                                 (propertize (let ((branch-name (git-prompt-branch-name)))
                                               (if branch-name
                                                   branch-name
                                                 "Not a git repository"))
                                             'face '(:foreground "pink")))))

(setq esh-clock (lambda () (concat (propertize "\xf017 " 'face '(:family "FontAwesome" :foreground "forest green"))
                                   (propertize (format-time-string "%H:%M" (current-time)) 'face '(:foreground "forest green")))))
;; (esh-section esh-git
;;              "\xe907"  ;  (git icon)
;;              (let ((branch-name (git-prompt-branch-name)))
;;                (if branch-name
;;                    branch-name
;;                  "Not a git repository"))
;;              '(:foreground "pink"))

;; (esh-section esh-python
;;              "\xe928"  ;  (python icon)
;;              "pyvenv-virtual-env-name")

;; (esh-section esh-clock
;;              "\xf017"  ;  (clock icon)
;;              (format-time-string "%H:%M" (current-time))
;;              '(:foreground "forest green"))

;; Below I implement a "prompt number" section
(setq esh-prompt-num 0)
(add-hook 'eshell-exit-hook (lambda () (setq esh-prompt-num 0)))
(advice-add 'eshell-send-input :before
            (lambda (&rest args) (setq esh-prompt-num (incf esh-prompt-num))))

(esh-section esh-num
             "\xf0c9"  ;  (list icon)
             (number-to-string esh-prompt-num)
             '(:foreground "brown"))

;; Choose which eshell-funcs to enable
(setq eshell-funcs (list esh-dir esh-git esh-clock))

;; Enable the new eshell prompt
(setq eshell-prompt-function 'esh-prompt-func)
