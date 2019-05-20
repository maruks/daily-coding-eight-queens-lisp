;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:queens-asd
  (:use :cl :asdf))

(in-package :queens-asd)

(asdf:defsystem "queens"
  :name "queens"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "queens"))))
  :in-order-to ((test-op (test-op "queens/tests"))))

(asdf:defsystem "queens/tests"
  :licence "Public Domain"
  :depends-on (:queens
	       :fiasco)
  :serial t
  :components ((:module "tests"
		:components ((:file "queens-tests"))))
  :perform (test-op (o c) (uiop:symbol-call 'fiasco 'all-tests)))
