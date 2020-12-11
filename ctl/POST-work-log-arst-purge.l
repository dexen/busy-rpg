
(rc ".busyrpg/xp-log-v2.rc" 'XP-Log
	(let (
			OldStack (rc ".busyrpg/xp-log-v2.rc" 'XP-Log)
			NewStack ()
			CurrentSettlement (caddr (car Stack))
			Settlement (if (chance-random-percent 20) (settlement-random) CurrentSettlement)
		)
		(while OldStack
			(let Tmp (pop 'OldStack)
				(when (n== "arst" (cadr Tmp))
					(queue 'NewStack Tmp) )
			) )
		NewStack ) )

(redirect "/")
