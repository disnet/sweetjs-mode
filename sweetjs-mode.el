;;; sweetjs-mode.el --- Minor mode to edit Sweet.js files in Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2014 Tim Disney

;; Version: 0.1.0
;; Keywords: Javascript minor mode
;; Author: Tim Disney <tim@disnet.me>
;; URL: http://github.com/disnet/sweetjs-mode
;; Package-Requires: ((emacs "24.1") (cl-lib "0.5"))

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;; Code:

(defgroup sweetjs nil
  "A minor mode for sweet.js"
  :group 'languages)

(defun sweetjs-turn-on ()
  "Turn on sweetjs mode."
  (message "it's on!"))

(defun sweetjs-turn-off ()
  "Turn off sweetjs mode."
  (message "it's off!"))

(defun sweetjs-compile-region (start end)
  "Compile the region."
  (interactive "r")
  (message "compiling")

  (let ((buffer (get-buffer "*sweetjs-compiled*")))
    (when buffer
      (kill-buffer buffer)))

  (apply (apply-partially 'call-process-region start end "sjs" nil
                          (get-buffer-create "*sweetjs-compiled*")
                          nil)
         (list "-s"))

  (with-current-buffer "*sweetjs-compiled*"
    (javascript-mode))

  (display-buffer-other-frame "*sweetjs-compiled*")

  )

(defun sweetjs-compile-buffer ()
  (interactive)
  (sweetjs-compile-region (point-min) (point-max)))

(define-minor-mode sweetjs-mode
  "Adds some sweetjs convenience functions to emacs"
  :lighter "Sjs"
  (progn
    (if sweetjs-mode
        (sweetjs-turn-on)
      (sweetjs-turn-off))))


(provide 'sweetjs-mode)

;;; sweetjs-mode ends here
