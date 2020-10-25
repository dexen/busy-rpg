(html
	0 *Title *Css NIL
	(<tag> 'h1 NIL "Work log")

	(<tag> 'table NIL
		(mapcar
			'((Rcd)
				(let (Score (car Rcd) Work (cadr Rcd) Type (car (caddr Rcd)) Name (cadr (caddr Rcd)) )
					(<tag> 'tr' NIL 
						(<tag> 'td (cons "style" "text-align: right") Score)
						(<tag> 'td NIL Work)
						(<tag> 'td NIL Type)
						(<tag> 'td NIL " of " Name)
					) ) )
			(rc ".busyrpg/xp-log-v2.rc" 'XP-Log)
		)
	)
)
