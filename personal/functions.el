
;; C++ modifications
(global-set-key [(f9)] 'compile)
(setq compilation-window-height 14)
(c-toggle-hungry-state 1)

(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;; errors happened
            (message "compilation errors, press C-x ` to visit")

          ;; no errors
          (run-at-time 1.0 nil 'delete-windows-on buf)
          (message "NO COMPILATIONS ERRORS!"))))

;; google weather
(require 'google-weather)
(require 'org-google-weather)

;; shell mode
(defun sh ()
  "Launch an ANSI term with /bin/bash"
  (interactive)
  (ansi-term "/bin/bash"))

;; kill all buffers
(defun kill-other-buffers ()
  "Kill all other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (message "ALL OTHER BUFFERS KILLED"))

(global-set-key [(f5)] 'kill-other-buffers)

;; kill all dired buffers
(defun kill-all-dired-buffers()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let((count 0))
      (dolist(buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'dired-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count ))))
