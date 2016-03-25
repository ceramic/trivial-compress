(in-package :cl-user)
(defpackage trivial-compress.cl
  (:use :cl)
  (:documentation "Compress using pure Common Lisp."))
(in-package :trivial-compress.cl)

(defun tar-up (directory archive)
  "Create a tar archive from the contents of a directory."
  (declare (type pathname directory archive))
  (let ((*default-pathname-defaults* directory)
        (files (list)))
    (flet ((relativize (pathname)
             (uiop:subpathp pathname *default-pathname-defaults*)))
      (cl-fad:walk-directory directory
                             #'(lambda (pathname)
                                 (push (relativize pathname) files))))
    (archive::create-tar-file archive files)
    archive))
