(defun prove? (target facts rules)
    (if (member target facts)
	T
	(lookUp target facts rules))
)

(defun lookUp (target facts rules)
    (let (facts))

)

(setf facts '(A B C))
(setf rules '(
    ((and A B) D)
    ((or A C) E)
    ((OR (NOT B) A) F)
    ((F) G) ))

(prove? 'G facts rules)
