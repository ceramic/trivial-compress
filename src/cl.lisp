(in-package :cl-user)
(defpackage trivial-compress.cl
  (:use :cl)
  (:documentation "Compress using pure Common Lisp."))
(in-package :trivial-compress.cl)

(defun subtract-pathname (root pathname)
  "root is an absolute directory, and pathname is an absolute pathname, such
  that pathname is inside of root. Remove the common directory components,
  leaving a relative pathname."
  (uiop:subpathp pathname root))

(defun tar-up (directory archive)
  "Create a tar archive from the contents of a directory."
  (declare (type pathname directory archive))
  (let ((*default-pathname-defaults* directory)
        (files (list)))
    (flet ((relativize (pathname)
             (subtract-pathname *default-pathname-defaults* pathname)))
      (cl-fad:walk-directory directory
                             #'(lambda (pathname)
                                 (push (relativize pathname) files))))
    (archive::create-tar-file archive files)
    archive))

(defun zip-up (directory archive)
  "Create a zip archive from the contents of a directory."
  (declare (type pathname directory archive))
  (zip:with-output-to-zipfile (zipfile archive)
    (flet ((write-directory (pathname)
             (zip:write-zipentry zipfile
                                 (namestring
                                  (subtract-pathname directory pathname))
                                 (make-concatenated-stream)
                                 :file-write-date (file-write-date pathname)))
           (write-file (pathname)
             (with-open-file (stream pathname
                                     :element-type '(unsigned-byte 8))
               (zip:write-zipentry zipfile
                                   (namestring
                                    (subtract-pathname directory pathname))
                                   stream
                                   :file-write-date (file-write-date pathname)))))
    (cl-fad:walk-directory directory
                           #'(lambda (pathname)
                               (unless (equal pathname directory)
                                 (if (uiop:directory-pathname-p pathname)
                                     (write-directory pathname)
                                     (write-file pathname))))
                           :directories :breadth-first))))
