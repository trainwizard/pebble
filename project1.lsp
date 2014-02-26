;Sam Bolds
;project 1

(defun prove? (target facts rules)
    (if (member target facts)
	T
	((null target) nil)
	((listp target) (cond ((eql 'and (car target)) (lookUpAll(cdr target) facts rules))
							 ((eql 'or (car target)) (lookUpPart (cdr target) facts rules))
							 ((eql 'not (car target)) (not (prove?(cdr target) facts rules)))
							 (t (lookUpAll target facts rules))))
		 (t (prove? (pre-condition target rules) facts rules)))
)


(defun lookUpPart (target facts rules)
    (let (facts))
	(if (null target)
		nil
		(or (prove? (car target) facts rules) (lookUpPart(cdr target) facts rules)))
)

(defun lookUpAll (target facts rules)
	(if (null target)
		t
		(and (prove? (car target) facts rules) (lookUpAll(cdr target) facts rules)))
)

(setf facts '(A B C))
(setf rules '(
    ((and A B) D)
    ((or A C) E)
    ((OR (NOT B) A) F)
    ((F) G) ))

(prove? 'a facts rules)