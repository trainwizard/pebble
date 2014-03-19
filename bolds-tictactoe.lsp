;Sam Bolds with the help of stack overflow


(defconstant *empty* #\Space)
(defconstant *naught* #\O)
(defconstant *cross* #\X)

;Make empty Array
(defun make-board ()
  "-> board"
  (make-array '(3 3) :initial-element *empty*))

;get board position
(defun get-position (board x y)
  "board x coordinate x coordinate -> symbol"
  (aref board x y))

;check to see if postion is free
(defun free-position? (board x y)
  "board x coordinate x coordinate -> truth value"
  (let ((sym (aref board x y)))
    (eq sym *empty*)))

;put desired symbol in board
(defun update-board (board x y sym)
  "board x coordinate x coordinate x symbol -> board"
  (setf (aref board x y) sym)
  board)

;board printage
(defun print-board (board)
  "board ->"
  (labels ((print-row (y)
	     (format t " ~a " y)
	     (dotimes (x 3)
	       (format t "| ~a " (get-position board x y)))
	     (format t "|~&"))
	   (print-separator ()
	     (format t "   +---+---+---+~&")))
    (format t "~&     0   1   2~&")
    (print-separator)
    (dotimes (y 3)
      (print-row y)
      (print-separator))))

;Check to see if board is full to know if to end the game
(defun board-full? (board)
  "board -> truth value"
  (let ((free-positions 0))
    (dotimes (x 3)
      (dotimes (y 3)
	(if (free-position? board x y) (incf free-positions))))
    (= 0 free-positions)))


(defun winner (board)
  "board -> symbol"
  (let ((combinations '(((0 . 0) (0 . 1) (0 . 2))
			((1 . 0) (1 . 1) (1 . 2))
			((2 . 0) (2 . 1) (2 . 2))
			((0 . 0) (1 . 0) (2 . 0))
			((0 . 1) (1 . 1) (2 . 1))
			((0 . 2) (1 . 2) (2 . 2))
			((0 . 0) (1 . 1) (2 . 2))
			((0 . 2) (1 . 1) (2 . 0))))
	(result *empty*))
    (labels ((get-combination (combination)
	       (mapcar #'(lambda (coords) (get-position board 
							(car coords)
							(cdr coords)))
		       combination)))
      (dolist (combination combinations result)
	(let ((row (get-combination combination)))
	  (if (and (eq (first row) (second row))
		   (eq (second row) (third row))
		   (not (eq (first row) *empty*)))
	      (setq result (first row))))))))


;computers move
(defun computer-move (board computer-symbol)
  "board x symbol ->"
  (format t "~&The computer makes a move.")
  (generate-move-random board computer-symbol))

;Generates random moves, this AI is pretty stupid... 
(defun generate-move-random (board computer-symbol)
  "board x symbol ->"
  (let ((x 0) (y 0))
    (loop
      (setq x (random 3))
      (setq y (random 3))
      (when (free-position? board x y)
	(update-board board x y computer-symbol)
	(return)))))



(defmacro swap (var1 var2)
  `(let ((temp ,var1))
     (setq ,var1 ,var2)
     (setq ,var2 temp)))


;Starting game function
(defun tic-tac-toe ()
  (let ((input nil))
    (loop
      (format t "~&Welcome to Tic-tac-toe!~&-----------------------~&")
      (format t "1. Play game~&2. Quit~&Enter choice and press Enter: ")
      (setq input (read))
      (if (and (numberp input) (= input 1))
	  (main-loop))
      (if (and (numberp input) (= input 2))
	  (return)))))
;main function of the game
(defun main-loop ()
  (let ((rounds 0) 
	(points-player 0) (points-computer 0)
	(symbol-player *naught*) (symbol-computer *cross*)
	(winner *empty*))
    (format t "~&A new game begins!")
    (loop
    ;thought about it then decided to not implement a Round system
      (setq rounds 1)
      (when (and (numberp rounds) (>= rounds 1))
	(return)))
      ;(format t "~&Invalid numbe of rounds! Try again!"))
    ;; 2. Play the rounds
    (dotimes (this-round rounds)
      (format t "~&Round ~a of ~a. You play ~a.~&" 
	      (1+ this-round) rounds symbol-player)
      (setq winner (game-loop symbol-player))
      (cond ((eq winner symbol-player) 
	     (incf points-player 2))
	    ((eq winner symbol-computer) 
	     (incf points-computer 2))
	    (t (incf points-player)
	       (incf points-computer)))
      (if (eq winner *empty*)
	  (format t "~&It's a draw!~&")
	(format t "~&~a is the winner!~&" winner))
      (swap symbol-player symbol-computer))
    ;; 3. Print the final result
    (cond ((> points-computer points-player)
	   (format t "~&The computer wins the game!~&"))
	  ((< points-computer points-player)
	   (format t "~&The player wins the game!~&"))
	  (t (format t "~&Nobody wins!~&")))))

	;Chooses which player starts
	;Goes to player or computer moves
	(defun game-loop (symbol-player)
  (let ((symbol-computer (if (eq *cross* symbol-player) *naught* *cross*))
	(board (make-board))
	(winner *empty*)
	(current (if (eq *cross* symbol-player) 'player 'computer)))
	(format t "~&Who shall go first?~&-----------------------~&")
	(format t "1. Player ~&2. Computer~&Enter choice and press Enter: ")
	(setq choice (read))
	(if (= choice 1)
	(setq current 'computer))
	
	(if (= choice 2)
	(setq current 'player))
	
    (loop
      (print-board board)
      (if (eq current 'player)
	  (computer-move board symbol-computer)
	(player-move board symbol-player))
      (setq current (if (eq current 'player) 'computer 'player))
      (setq winner (winner board))
      (when (not (eq winner *empty*))
	(print-board board)
	(return winner))
      (when (board-full? board)
	(print-board board)
	(return *empty*)))))

;Player inputs move
(defun player-move (board symbol-player)
  (let ((x 0) (y 0))
    (loop
      (loop
	(format t "~&Enter X and Y coordinates with space in between: ")
	(setq x (read))
	(setq y (read))
	(when (and (numberp x) (numberp y)
		   (<= 0 x 2) (<= 0 y 2))
	  (return)))
      (when (free-position? board x y)
	(update-board board x y symbol-player)
	(return))
      (format t "~&Position taken! Try again!"))))

