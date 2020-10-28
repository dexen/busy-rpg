(de Finfo (Label Value)
	(<tag> 'b NIL Label)
	(prin " ")
	(<tag> 'span NIL Value)
	(<br>) )

(de FieldEdit (Label Type Name Value)
	(<p> NIL
		(<tag> 'label NIL
			Label ":" (<br>)
			(<input> NIL Type Name Value) ) ) )

(html
	0 *Title *Css NIL

	(<form> NIL 'POST "/work-performed?foo=bar&aa=bb"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Note performed work")
			(<tag> 'label NIL "The work performed:"
				(<br>)
				(<tag> 'input '(("name" . "Work-Performed") ("size" . 64) ("autofocus")))
			(<br>)
			(<button> NIL 'submit 'action "work-performed"
				(<span> NIL "Save work") ) ) ) )

	(if (info ".busyrpg/instance-dev.txt")
		(<p> '("style" . "background: green; color: white") "dev instance")
		(<p> '("style" . "background: red") "production instance") )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current character")
		(<p> NIL
			(Finfo "Name:" (rc ".busyrpg/character.rc" 'Name))
			(Finfo "HP:" (rc ".busyrpg/character.rc" 'HP))
			(Finfo "XP:" (rc ".busyrpg/character.rc" 'XP))
			(Finfo "Township:" (rc ".busyrpg/character.rc" 'Township)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current weapon")
		(<p> NIL
			(Finfo "Name:" (rc ".busyrpg/character.rc" 'Weapon-Name))
			(Finfo "Attack:" (rc ".busyrpg/character.rc" 'Weapon-Attack)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current armor")
		(<p> NIL
			(Finfo "Name:" (rc ".busyrpg/character.rc" 'Armor-Name))
			(Finfo "Defense:" (rc ".busyrpg/character.rc" 'Armor-Defense)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current vehicle")
		(<p> NIL
			(Finfo "Type:" (rc ".busyrpg/character.rc" 'Vehicle-Type))
			(Finfo "Name:" (rc ".busyrpg/character.rc" 'Vehicle-Name))
			(Finfo "Travel chance [%]:" (rc ".busyrpg/character.rc" 'Vehicle-Travel-Chance)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Latest work")
		(<tag> 'table NIL
			(mapcar '((Rcd)
					(<tag> 'tr NIL
						(tag 'td NIL NIL (car Rcd))
						(tag 'td NIL NIL (cadr Rcd))
						(tag 'td NIL NIL (list "in " (car (caddr Rcd)) " of " (cadr (caddr Rcd))))
					)
				)
				(head 8 (rc ".busyrpg/xp-log-v2.rc" 'XP-Log))
			)
		)
#		(<tag> 'pre NIL
#			(mapcar '((Pair) (prinl (car Pair) ": " (cadr Pair))) (head 8 (rc ".busyrpg/xp-log-v2.rc" 'XP-Log))) )
		(<tag> 'a (cons "href" "/work-log") "Full work history...") )

	(<div> '("style" . "clear: both"))

	(<form> NIL 'POST "/attributes?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Set character attributes")
			(FieldEdit "Name" 'text 'Name (rc ".busyrpg/character.rc" 'Name))
			(FieldEdit "HP" 'text 'HP (or (rc ".busyrpg/character.rc" 'HP) 100))
			(FieldEdit "XP" 'text 'XP (or (rc ".busyrpg/character.rc" 'XP) 0))
			(FieldEdit "Township" 'text 'Township (or (rc ".busyrpg/character.rc" 'Township) "The home farm"))
			(<button> NIL 'submit 'action "set-character-attributes"
				(<span> NIL "Save character") ) ) )

	(<form> NIL 'POST "/weapon?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust weapon")
			(FieldEdit "Name" 'text 'Weapon-Name (rc ".busyrpg/character.rc" 'Weapon-Name))
			(FieldEdit "Attack" 'text 'Weapon-Attack (or (rc ".busyrpg/character.rc" 'Weapon-Attack) 10))
			(<button> NIL 'submit 'action "set-weapon"
				(<span> NIL "Save weapon") ) ) )

	(<form> NIL 'POST "/armor?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust armor")
			(FieldEdit "Name" 'text 'Armor-Name (rc ".busyrpg/character.rc" 'Armor-Name))
			(FieldEdit "Defense" 'text 'Armor-Defense (or (rc ".busyrpg/character.rc" 'Armor-Defense) 5))
			(<button> NIL 'submit 'action "set-armor"
				(<span> NIL "Save weapon") ) ) )

	(<form> NIL 'POST "/vehicle?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust vehicle")
			(FieldEdit "Type" 'text 'Vehicle-Type (or (rc ".busyrpg/character.rc" 'Vehicle-Type) "Air skiff"))
			(FieldEdit "Name" 'text 'Vehicle-Name (rc ".busyrpg/character.rc" 'Vehicle-Name))
			(FieldEdit "Travel Chance [%]" 'text 'Vehicle-Travel-Chance (or (rc ".busyrpg/character.rc" 'Vehicle-Travel-Chance) 10))
			(<button> NIL 'submit 'action "set-vehicle"
				(<span> NIL "Save vehicle") ) ) )

	(<form> NIL 'POST "/work-performed?foo=bar&aa=bb"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Note performed work")
			(<tag> 'label NIL "The work performed:"
				(<br>)
				(<tag> 'textarea '(("name" . "Work-Performed") ("rows" . 3) ("cols" . 40)))
			(<br>)
			(<button> NIL 'submit 'action "work-performed"
				(<span> NIL "Save work") ) ) ) )

	(<form> NIL 'POST "/xp-gain?foo=bar&aa=bb"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust XP")
			(FieldEdit "XP to add" 'text 'xp-gain 1)
			(<button> NIL 'submit 'action "xp-gain"
				(<span> NIL "Add XP") ) ) ) )
