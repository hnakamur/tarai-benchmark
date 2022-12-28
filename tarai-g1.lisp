(defun tarai (x y z)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (labels ((tarai (x y z)
             (declare (fixnum x y z))
             (the fixnum
                  (if (> x y)
                      (tarai (tarai (1- x) y z)
                             (tarai (1- y) z x)
                             (tarai (1- z) x y))
                      y))))
    (declare (inline tarai))
    (tarai x y z)))

(compile 'tarai)

(princ (time (tarai 14 7 0)))
(terpri)
