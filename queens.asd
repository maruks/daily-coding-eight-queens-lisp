(defsystem "queens"
  :name "queens"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "queens"))))
  :in-order-to ((test-op (test-op "queens/tests"))))

(defsystem "queens/tests"
  :licence "Public Domain"
  :depends-on (:queens
	       :fiasco)
  :serial t
  :components ((:module "tests"
		:components ((:file "queens-tests"))))
  :perform (test-op (o c) (symbol-call 'fiasco 'all-tests)))
