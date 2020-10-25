	# FIXME remove
(load "name-base.l")
(load "lib.l")

(when (info ".busyrpg/xp-log.rc")
	(when (info ".busyrpg/xp-log-v2.rc")
		(throw "new file already exists") )
	(let (
		Stack NIL
		InitialSettlement (settlement-random)
		save-to-v2 '((XpAction)
			(setq Stack (rc ".busyrpg/xp-log-v2.rc" 'XP-Log))
			(push 'Stack (list (car XpAction) (cdr XpAction) InitialSettlement))
			(rc ".busyrpg/xp-log-v2.rc" 'XP-Log
				Stack ) )
		)
		(mapcar save-to-v2 (rc ".busyrpg/xp-log.rc" 'XP-Log))
	)
)
