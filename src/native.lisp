(in-package :cl-user)
(defpackage trivial-compress.native
  (:use :cl)
  (:documentation "Compress using native utilities."))
(in-package :trivial-compress.native)

(defun tar-up (binary directory archive)
  "Create a tar archive from the contents of a directory."
  (uiop:run-program
   (format nil "~S cv -C ~S -f ~S "))

(defun zip-up (binary directory archive)
  "Create a zip archive from the contents of a directory.")
