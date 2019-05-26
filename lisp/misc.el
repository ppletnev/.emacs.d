(defun _das-test-res-files ()
  (file-expand-wildcards
   (concat (abbreviate-file-name (eshell/pwd)) "/doc/*/*_TPLSPC_TREP.html")))

(defun _das-print-result (module pc-fail pc-all ecu-fail ecu-all)
  (let ((pc-success (= pc-fail 0)) (ecu-success (= ecu-fail 0))
        (pc-pass (number-to-string (- pc-all pc-fail)))
        (ecu-pass (number-to-string (- ecu-all ecu-fail)))
        (pc-all (number-to-string pc-all))
        (ecu-all (number-to-string ecu-all)))
    (let ((pc-color (if pc-success "dark green" "dark red"))
          (ecu-color (if ecu-success "dark green" "dark red"))
          (module-color (if (and pc-success ecu-success) "dark green" "dark red")))
      (eshell-printn (concat
                      (propertize (concat (format "%-6s" module) "  ")
                                  'face (list :background module-color :box (face-attribute 'default :background)))
                      " "
                      (propertize (format "%-12s" (concat "PC: " pc-pass "/" pc-all))
                                  'face (list :background pc-color :box (face-attribute 'default :background)))
                      " "
                      (propertize (format "%-12s" (concat "ECU: " ecu-pass "/" ecu-all))
                                  'face (list :background ecu-color :box (face-attribute 'default :background)))
                      "")))))

(defun das-test-res (&optional module)
  (progn
    (eshell-printn "Test results:")
    (dolist (report-file (_das-test-res-files))
      (string-match "/doc/[a-zA-Z0-9_]+/\\([a-zA-Z0-9]+\\)_TPLSPC_TREP\\.html" report-file)
      (let ((module (match-string 1 report-file))
            (pc-fail) (pc-all) (ecu-fail) (ecu-all) (search-success t))
            (with-temp-buffer
              (insert-file-contents report-file)
              (setq case-fold-search t)
              (if (search-forward-regexp
                   (concat
                    "NO\\. TESTED TESTCASES:\\s *</td><td>"
                    "<input size=\"?32\"? type=\"text\" value=\\s *\"\\([0-9]+\\)\"\\s *>"
                    "<input size=\"?32\"? type=\"text\" value=\\s *\"\\([0-9]+\\)\"\\s *> </td></tr>\n"
                    "<tr><td>NO\\. OF DETECTED ERRORS:\\s *</td><td>"
                    "<input size=\"?32\"? type=\"text\" value=\\s *\"\\([0-9]+\\)\"\\s *>"
                    "<input size=\"?32\"? type=\"text\" value=\\s *\"\\([0-9]+\\)\"\\s *> </td></tr>\n")
                   nil t)
                (progn (setq pc-fail (string-to-number (match-string 3)))
                       (setq pc-all (string-to-number (match-string 1)))
                       (setq ecu-fail (string-to-number (match-string 4)))
                       (setq ecu-all (string-to-number (match-string 2))))
                (setq search-success nil)))
            (if search-success
                (_das-print-result module pc-fail pc-all ecu-fail ecu-all))))))
