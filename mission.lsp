;Sam Bolds
;Random Mission Statement Generator
;Completed April 27th 2014

(setf *random-state* (make-random-state t)) ;important!!!

(setq intro '(“Our company strives to ”
“Our corporation will “
“It is our mission to “
“We exist to “
“Our company is dedicated to “
“Our business’ mission is to “
“Our organization inspires to “
“We endeavor to “
“It is our job to “
“We seek to “
“We work to “
“We compete to “
“Our vision is to “
“Our business makes every effort to “
“Our organization contends to “
) )
(setq adverb '("appropriately "
"assertively "
"authoritatively "
"collaboratively "
"competently " 
"completely " 
"continually " 
"conveniently " 
"credibly "
"distinctively " 
"dramatically " 
"dynamically " 
"efficiently "
"enthusiastically " 
"globally " 
"holisticly " 
"interactively "
"intricately " 
"objectively " 
"pro-actively " 
"professionally "
"progressively " 
"quickly " 
"seamlessly " 
"synergistically "
"regionally "
"realistically "
"effectively ") )
(setq verb '("actualize " 
"administrate " 
"build " 
"communicate " 
"conceptualize "
"coordinate " 
"create " 
"customize " 
"develop " 
"disseminate " 
"empower "
"engineer " 
"enhance " 
"facilitate " 
"fashion " 
"foster " 
"impact "
"initiate " 
"integrate " 
"leverage existing " 
"leverage other's "
"maintain " 
"negotiate " 
"network " 
"parallel task " 
"promote "
"provide access to " 
"pursue " 
"re-engineer " 
"re-invent " 
"restore "
"revolutionize " 
"simplify " 
"streamline " 
"supply " 
"utilize ") )
(setq adjective '("accurate " 
"adaptive " 
"alternative " 
"an expanded array of "
"backward-compatible " 
"best of breed " 
"business " 
"client-based "
"client-centered " 
"client-centric " 
"client-focused " 
"collaborative "
"competitive " 
"cooperative " 
"corporate " 
"cost effective "
"cross functional " 
"cross-unit " 
"customer-directed " 
"cutting edge "
"distinctive " 
"diverse " 
"economically sound " 
"effective " 
"emerging " 
"empowered " 
"enabled " 
"enterprise-wide " 
"equity invested " 
"error-free "
"ethical " 
"excellent " 
"exceptional " 
"flexible " 
"fully researched "
"fully tested " 
"functional " 
"functionalized " 
"future-proof " 
"global "
"go forward " 
"goal-oriented " 
"high standards in " 
"high-payoff "
"high-quality " 
"highly efficient " 
"inexpensive " 
"innovative "
"installed base " 
"integrated " 
"interactive " 
"interdependent "
"interoperable " 
"just in time " 
"leading-edge " 
"leveraged "
"long-term high-impact " 
"low-risk high-yield " 
"maintainable "
"market positioning " 
"market-driven " 
"mission-critical "
"multidisciplinary " 
"multifunctional " 
"multimedia based " 
"optimal "
"orthogonal " 
"parallel " 
"performance based " 
"premier " 
"premium "
"principle-centered " 
"proactive " 
"process-centric " 
"professional "
"progressive " 
"prospective " 
"quality " 
"reliable "
"resource-leveling " 
"resource maximizing " 
"scalable " 
"stand-alone "
"standards compliant " 
"state of the art " 
"strategic " 
"superior "
"sustainable " 
"tactical " 
"team building " 
"team driven "
"technically sound " 
"timely " 
"top-line " 
"turnkey " 
"unique "
"user friendly " 
"value-added " 
"virtual " 
"world-class " 
"worldwide ") )
(setq noun '(“achievements “
“accomplishments “
“aid “
“applied science “
“automation “
“benefits “
“catalysts for change “
“content “ 
“data “
“deliverables “
“education “
“greater good “
"growth strategies "
“high tech “
"human capital "
“industrial science “
“information “
“infrastructures “
“intellectual capital “
“knowledge “
“leadership skills “
"manufactured products "
"materials "
“mechanization “
"meta-services "
“lifelong learning “
“materials “
“meta-services “
“methods “
“methods of empowerment “
“mindshare “
“opportunities “
“output “
“paradigms “
“power “
“products “
“resources “
“results “
"scenarios "
“services “
“solutions “
“sources “
“statistics “
“support “
“technology “) )
(setq conjunction '(“and “
“and so “
“and so that “
“so that we may “
“so that we may continue “
“so that we may go on “
“so that we may maintain “
“so that we may progress “
“along with “
“including “
“as well as “
“also “
“furthermore “) )
(setq close '(“to give the customer what they deserve.”
“to bring 100% satisfaction.”
“to perpetuate learning.”
“to insure we deliver the kind of results that our investors expect and deserve.”
“through continual improvement.”
“to protect and enhance our customer experience.”
“to maximize sharing and innovation.”
“so that we will enrich the customer experience.”
“to improve the quality of customer experience.”
“to prepare the world.”
“to create an innovative world.”
“to work in partnership to create an informed public.”
“to enable the education of the next generation.”
“to meet our customer expectations.”
“to exceed customer’s needs.”
“to set us apart from our competitors.”
“with zero defects.”
“while promoting personal leadership.”
“while maintaining zero defects.”
“while striving for 100% on-time delivery.”) )

(defun selectTerm (lst)
	(nth (random (length lst)) lst) )

(defun mission-statement ()
    
(format t "~A" (concatenate 'string (selectTerm intro) 
	(selectTerm adverb) 
	(selectTerm verb) 
	(selectTerm adjective) 
	(selectTerm noun) 
	(selectTerm conjunction)
	(selectTerm close) )))

(mission-statement)
