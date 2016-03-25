(defsystem trivial-compress-test
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:trivial-compress
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "trivial-compress")))))
