
	# from-to, inclusive limits
(de random-integer (LimitA LimitB)
	(if LimitB
		(setq Add LimitA Mod (- LimitB LimitA -1))
		(setq Add 0 Mod (+ LimitA 1)) )

	(when (> Mod 255)
		(throw "upper limit too high") )
	(when (<= Mod 0)
		(throw "upper limit too low") )
	(when (< Add 0)
		(throw "lower limit too low") )
	(+ (% (in "/dev/random" (rd 1)) Mod) Add) )

(de str-ucfirst (Str)
	(when (lst? Str)
		(setq Str (glue "" Str)) )
	(text "@1@2" (uppc (car (chop Str))) (glue "" (cdr (chop Str))))
)

(de chance-random-percent (Percent)
	(<= (random-integer 1 100) Percent)
)
