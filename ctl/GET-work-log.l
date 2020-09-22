(html
	0 *Title *Css NIL
	(<tag> 'h1 NIL "Work log")

	(<tag> 'table NIL
		(mapcar
			'((Pair)
				(let (Score (car Pair) Work (cadr Pair))
					(<tag> 'tr' NIL 
						(<tag> 'td (cons "style" "text-align: right") Score)
						(<tag> 'td NIL Work) ) ) )
			(rc "xp-log.rc" 'XP-Log)
		)
	)
)
