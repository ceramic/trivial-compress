(defsystem trivial-compress
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")
  :depends-on (:archive
               :zip
               :which
               :uiop
               ;; Utilities
               :alexandria)
  :components ((:module "src"
                :serial t
                :components
                ((:file "cl")
                 (:file "native")
                 (:file "trivial-compress"))))
  :description "Compress a directory."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op trivial-compress-test))))
