(in-package :cl-user)
(defpackage trivial-compress.native
  (:use :cl)
  (:export :tar
           :zip)
  (:documentation "Compress using native utilities."))
(in-package :trivial-compress.native)

(defun tar (binary directory archive)
  "Create a tar archive from the contents of a directory."
  ;; FIXME: inserts a root '.' directory
  (uiop:with-current-directory (directory)
    (uiop:run-program
     (format nil "~S cf ~S ."
             (namestring binary)
             (namestring archive)))))

(defun zip (binary directory archive)
  "Create a zip archive from the contents of a directory."
  (uiop:with-current-directory (directory)
    (uiop:run-program
     (format nil "~S -r ~S *"
             (namestring binary)
             (namestring archive)))))
