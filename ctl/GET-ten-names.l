(load "lib.l")

(load "name-base.l")

(setq Aaa '(("Foo" "fx") ("bar" "bx") ("baz" "bz")))
(setq Aaa (list (list "Village named" (random-katakana-word)) (list "Town named" (random-katakana-word)) (list "City named" (random-katakana-word))))

(html
	0 *Title *Css NIL
	(<tag> 'h1 NIL "Ten names")

	(<tag> 'table NIL
		(mapcar
			'((Pair)
				(let (Score (car Pair) Work (cadr Pair))
					(<tag> 'tr' NIL 
						(<tag> 'td NIL Score)
						(<tag> 'td NIL Work) ) ) )
			Aaa
		)
	)
)

#(show 'Aaa)
