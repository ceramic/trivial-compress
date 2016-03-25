(in-package :cl-user)
(defpackage trivial-compress-test
  (:use :cl :fiveam)
  (:export :run-tests))
(in-package :trivial-compress-test)

(def-suite tests
  :description "trivial-compress tests.")
(in-suite tests)

(macrolet ((sys-rel (path)
             `(asdf:system-relative-pathname :trivial-compress ,path)))

  (defparameter +dir+
    (sys-rel #p"t/dir/"))

  (defparameter +tar+
    (sys-rel #p"t/file.tar"))

  (defparameter +zip+
    (sys-rel #p"t/file.zip")))

(test .tar
  (finishes
   (trivial-compress:tar +dir+ +tar+)))

(test .zip
  (finishes
   (trivial-compress:zip +dir+ +zip+)))

(defun run-tests ()
  (run! 'tests))
