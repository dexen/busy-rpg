(de trimBoth (Str)
	(pack (clip (chop Str))) )

(setq XpMin -10)
(setq XpMax 30)
(setq XpMod (- XpMax XpMin))

(setq Work-Performed (trimBoth (get '*RequestPost 'Work-Performed)))

(setq TheHash
	(pack
		(mapcar 
			'((B) (pad 2 (hex B)))
			(native 
				"libcrypto.so"
				"SHA1"
				'(B . 20)
				Work-Performed
				(length Work-Performed)
				'(NIL (20)) ) ) ) )

(setq PseudoRandomDigestOfWork (hex (head 4 (chop TheHash))))
(setq XpGain (+ (% PseudoRandomDigestOfWork (- XpMax XpMin -2)) XpMin 1))

(let Stack NIL
	(rc ".busyrpg/xp-log-v2.rc" 'XP-Log
		(when T
			(setq Stack
				(rc ".busyrpg/xp-log-v2.rc" 'XP-Log) )
			(push 'Stack (list XpGain Work-Performed))
			Stack ) ) )

(let XP 0
	(mapcar '((vv) (setq XP (+ XP (car vv)))) (rc ".busyrpg/xp-log-v2.rc" 'XP-Log))
	(rc ".busyrpg/character.rc" 'XP XP) )

(redirect "/")
