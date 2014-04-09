;sam bolds


(defun prefix ()
    (setf rand (random 7))
    (cond ((eql rand 0) "Our goal is")
          ((eql rand 1) "It is our desire")
          ((eql rand 2) "The sole purpose of our regime is")
          ((eql rand 3) "The reason we exist is")
          ((eql rand 4) "You don't love your family unless you help us")
          ((eql rand 5) "We are pleased")
          ((eql rand 6) "We strive")))


(defun action ()
    (setf rand (random 6))
    (cond ((eql rand 0) "create")
          ((eql rand 1) "build")
          ((eql rand 2) "develop")
          ((eql rand 3) "produce")
          ((eql rand 4) "give life to")
          ((eql rand 5) "generate")))

(defun neg_action ()
    (setf rand (random 5))
    (cond ((eql rand 0) "destroy")
          ((eql rand 1) "burn")
          ((eql rand 2) "set fire to")
          ((eql rand 3) "smash")
          ((eql rand 4) "slowly extract the willful desire from")))



(defun descriptor ()
  (setf rs NIL)
  (setf prev_rand -1)
  (setf stop (+ (random 3) 1))
  (do ((i 0 (+ i 1)))
      ((equal i stop) 'done)

    (do ((i 0 (+ i 0))) ;while loop
      ((not (equal rand prev_rand)) 'done)
      (setf rand (random 9)))
    (setf prev_rand rand)
    (cond ((eql rand 0) (setf rs (concatenate 'string rs " intelligent")))
          ((eql rand 1) (setf rs (concatenate 'string rs " world-class")))
          ((eql rand 2) (setf rs (concatenate 'string rs " innovative")))
          ((eql rand 3) (setf rs (concatenate 'string rs " jamming")))
          ((eql rand 4) (setf rs (concatenate 'string rs " awesome-sauce")))
          ((eql rand 5) (setf rs (concatenate 'string rs " totally rad")))
          ((eql rand 6) (setf rs (concatenate 'string rs " out there")))
          ((eql rand 7) (setf rs (concatenate 'string rs " hot")))
          ((eql rand 8) (setf rs (concatenate 'string rs " smashing"))))
    (if (and (equal i 0) (equal stop 2))
      (setf rs (concatenate 'string rs " and")))
    (if (and (equal i 0) (equal stop 3))
      (setf rs (concatenate 'string rs ",")))
    (if (and (equal i 1) (equal stop 3))
      (setf rs (concatenate 'string rs ", and")))
    )
  rs)


(defun product ()
  (setf rand (random 11))
    (cond ((eql rand 0) " products")
          ((eql rand 1) " services")
          ((eql rand 2) " systems")
          ((eql rand 3) " utilties")
          ((eql rand 4) " kitchen faucet wrenches")
          ((eql rand 5) " pony figurines")
          ((eql rand 6) " lime green kapris")
          ((eql rand 7) " styrofoam bricks")
          ((eql rand 8) " yarn")
          ((eql rand 9) " merchandise")
          ((eql rand 10) " commodities")))


(defun course ()
  (setf rand (random 11))
    (cond ((eql rand 0) "teamwork")
          ((eql rand 1) "creativy")
          ((eql rand 2) "capitalism")
          ((eql rand 3) "socialist ideals")
          ((eql rand 4) "Machiavellian tyranny")
          ((eql rand 5) "vaguely anarchic rebellion")
          ((eql rand 6) "love")
          ((eql rand 7) "determination")
          ((eql rand 8) "hard work")
          ((eql rand 9) "stringent conformance to the principles of this mission statement")
          ((eql rand 10) "MAD SKILLZ")))


(defun punctuation ()
 (setf rand (random 8))
    (cond ((eql rand 0) ".")
          ((eql rand 1) "!")
          ((eql rand 2) "?")
          ((eql rand 3) " ;)")
          ((eql rand 4) " :)")
          ((eql rand 5) " :/")
          ((eql rand 6) ". okay?")
          ((eql rand 7) ". - Karl Marx")))



(defun mission-statement ()
  (setf statement 'string)

  (setf statement (concatenate statement (prefix)))
  (setf statement (concatenate 'string statement " to "))
  (setf pos_or_neg (random 4))
  (if (< pos_or_neg 3) 
     (progn
      (setf statement (concatenate 'string statement (action)))
      (setf statement (concatenate 'string statement (descriptor)))
      )
     (setf statement (concatenate 'string statement (neg_action))))
  (setf statement (concatenate 'string statement (product)))
  (setf statement (concatenate 'string statement " through "))
  (setf statement (concatenate 'string statement (course)))
  (setf statement (concatenate 'string statement (punctuation)))

  statement
  )


;(format t "~a~%" (mission-statement))
