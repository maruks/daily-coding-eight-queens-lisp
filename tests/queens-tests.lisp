(fiasco:define-test-package :queens-tests
  (:use :queens :fiasco))

(in-package :queens-tests)

(deftest queens-test ()
  (is (= 2 (n-queens 4)))
  (is (= 10 (n-queens 5)))
  (is (= 4 (n-queens 6)))
  (is (= 40 (n-queens 7)))
  (is (= 92 (n-queens 8)))
  (is (= 352 (n-queens 9)))
  (is (= 724 (n-queens 10)))
  (is (= 2680 (n-queens 11)))
  (is (= 14200(n-queens 12))))
