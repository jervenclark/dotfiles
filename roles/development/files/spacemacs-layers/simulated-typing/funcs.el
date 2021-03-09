;;; funcs.el --- Simulated typing layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: jervenclark <jervenclark@Hotrod>
;; URL: https://github.com/jervenclark/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defun simulated-typing-char (c short-pause long-pause)
  "Simulate typing characters one at a time"
  (let ((med-pause (/ (+ long-pause (* 2 short-pause)) 3.0)))
    (cond
     ((equal c ?.)
      (insert (char-to-string c))
      (sit-for long-pause))
     ((equal c ?,)
      (insert (char-to-string c))
      (sit-for med-pause))
     ((equal c ?\n)
      (sit-for med-pause) (insert (char-to-string c))
      (sit-for med-pause))
     (t
      (insert (char-to-string c))
      (sit-for short-pause)))))


(defun simulated-typing-text (str short-pause long-pause)
  "Simulate typing text blocks"
  (mapcar
   (lambda (strchar)
     (simulated-typing-char strchar short-pause long-pause))
   (string-to-list str)))


(defun simulated-typing-in-new-buffer
    (pause-between-keys pause-between-rows buffer-title file_ext text)
  "Create a new buffer, print text in it one character at a time, with a pause
between each character."
  (switch-to-buffer (get-buffer-create buffer-title))
  (erase-buffer)
  (cond ((string-equal file_ext "py") (python-mode))
        ((string-equal file_ext "org") (org-mode)))
  (simulated-typing-text text pause-between-keys pause-between-rows))


(defun simulated-typing-demo ()
  "Run simulated typing demo"
  (interactive)
  (let (
        (file_src "Projects/")
        (file_dest "Projects/python")
        (filenames (list "../Documents/python/variations.py"
                         "/notes/post.org"))
        (cps 15)
        (lpfactor 5))
    (loop for filename being the elements of filenames
          do

          (let ((file_ext (file-name-extension filename)))
            (simulated-typing-in-new-buffer
             (/ 1.0 cps)
             (* (/ 1.0 cps) lpfactor)
             (concat filename)
             file_ext
             (with-temp-buffer
               (insert-file-contents (concat file_src "/" filename))
               (buffer-string)))
            )
          (sleep-for 5)
          (message "Saved"))))


(defun simulated-typing-single-file ()
  "Run simulated typing from source file"
  (interactive)
  (let ((filename-to-type (read-file-name "Choose a filename: " nil "Projects/test.org" t "Projects/"))
        (cps (read-number "Choose a cps rate: " 10))
        (lpfactor (read-number "Choose a long-pause factor: " 4)))
    (simulated-typing-in-new-buffer
     (/ 1.0 cps)
     (* (/ 1.0 cps) lpfactor)
     (concat "Teletyping " filename-to-type "...")
     (nil)
     (with-temp-buffer
       (insert-file-contents filename-to-type)
       (buffer-string)))
    (message "Teletyping completed.")))
