;;; prelude-c.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright (c) 2011 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar.batsov@gmail.com>
;; URL: http://www.emacswiki.org/cgi-bin/wiki/Prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for cc-mode and the modes derived from it.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defun prelude-c-mode-common-hook ()
  (setq c-basic-offset 4)
  (prelude-turn-off-whitespace))

;; this will affect all modes derived from cc-mode, like
;; java-mode, php-mode, etc
(add-hook 'c-mode-common-hook 'prelude-c-mode-common-hook)

(defun prelude-makefile-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4))

(add-hook 'makefile-mode-hook 'prelude-makefile-mode-hook)

;; C++ modifications
(setq compilation-window-height 14)

(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;; errors happened
            (message "compilation errors, press C-x ` to visit")

          ;; no errors
          (run-at-time 1.0 nil 'delete-windows-on buf)
          (message "NO COMPILATIONS ERRORS!"))))


(provide 'prelude-c)

;;; prelude-c.el ends here
