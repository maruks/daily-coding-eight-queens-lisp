(defpackage :queens
  (:use cl)
  (:export n-queens))

(in-package :queens)

(defun all-pos (size)
  (loop :for x :below size :append
	(loop :for y :below size :collect (cons x y))))

(defun attack-positions (x y size)
  (nunion
   (nunion
    (loop :for xp :below size :collect (cons xp y))
    (loop :for yp :below size :collect (cons x yp)))
   (loop :for xp :below size
	 :append (loop :for yp :below size :if (or (= (+ xp yp) (+ x y)) (= (- xp yp) (- x y))) :collect (cons xp yp)))))

(defun queens (valid-positions size x)
  (cond ((= size x) 1)
	((null valid-positions) 0)
	(t (let ((place-pos (loop :for yp :below size :if (member (cons x yp) valid-positions :test #'equal) :collect (list x yp))))
	     (loop :for (x y) integer :in place-pos
		   :for n = (queens
			     (set-difference valid-positions (attack-positions x y size) :test #'equal)
			     size
			     (1+ x))
		   :sum n)))))

(defun n-queens (size)
  (queens (all-pos size) size 0))

(defun eight-queens ()
  (n-queens 8))
