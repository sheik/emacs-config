

;; google weather
(require 'google-weather)
(require 'org-google-weather)

(require 'gccsense)

;; restore scratch buffer if destroyed
(run-with-idle-timer 5 t
                     '(lambda () (get-buffer-create "*scratch*")))

;; find main org file quickly
(defun gtd ()
  (interactive)
  (find-file "~/Private/mygtd.org"))

(global-set-key [(f6)] 'gtd)

;; shell mode
(defun sh ()
  "Launch an ANSI term with /bin/bash"
  (interactive)
  (ansi-term "/bin/bash"))

;; kill all buffers
(defun kill-other-buffers ()
  "Kill all buffers except *scratch* and current buffer"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)
                           (delq (get-buffer "*scratch*") (buffer-list))))
  (message "ALL OTHER BUFFERS KILLED"))

(global-set-key [(f5)] 'kill-other-buffers)

;; bind autocomplete to shift+space
(global-set-key [(shift ?\ )] 'ac-complete-gccsense)

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
