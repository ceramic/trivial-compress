(in-package :cl-user)
(defpackage trivial-compress
  (:use :cl)
  (:import-from :alexandria
                :if-let)
  (:import-from :which
                :which)
  (:documentation "The main compress interface."))
(in-package :trivial-compress)

(defun tar (directory archive)
  "Create a tar archive from the contents of a directory."
  (if-let (bin (which "tar"))
    (trivial-compress.native:tar bin directory archive)
    (trivial-compress.cl:tar directory archive)))

(defun zip (directory archive)
  "Create a zip archive from the contents of a directory."
  (if-let (bin (which "zip"))
    (trivial-compress.native:zip bin directory archive)
    (trivial-compress.cl:zip directory archive)))
