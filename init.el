
;; https://github.com/bbatsov/prelude/issues/1225
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Keep Custom settings in a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load additional packages from "packages" folder
(dolist (path (directory-files "~/.emacs.d/packages" t "[a-zA-Z0-9][a-zA-Z0-9\\-_\\.]*"))
  (add-to-list 'load-path path))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Ensure that use-package is loaded
(unless (package-installed-p 'use-package)
  (package-initialize)
  (package-install 'use-package))

(require 'use-package)

;; Make sure that package is always loaded from ELPA if not present
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Update outdated packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; (byte-recompile-directory "~/.emacs.d/config" 0)

(use-package s)

(dolist (file (directory-files-recursively "~/.emacs.d/config" "[a-zA-Z0-9\\-_]+\\.el"))
        (load file))
