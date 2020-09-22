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

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current character")
		(<p> NIL
			(Finfo "Name:" (rc "character.rc" 'Name))
			(Finfo "HP:" (rc "character.rc" 'HP))
			(Finfo "XP:" (rc "character.rc" 'XP)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current weapon")
		(<p> NIL
			(Finfo "Name:" (rc "character.rc" 'Weapon-Name))
			(Finfo "Attack:" (rc "character.rc" 'Weapon-Attack)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Current armor")
		(<p> NIL
			(Finfo "Name:" (rc "character.rc" 'Armor-Name))
			(Finfo "Defense:" (rc "character.rc" 'Armor-Defense)) ) )

	(<tag> 'fieldset '("style" . "float: left")
		(<tag> 'legend NIL "Latest work")
		(<tag> 'pre NIL
			(mapcar '((Pair) (prinl (car Pair) ": " (cadr Pair))) (head 8 (rc "xp-log.rc" 'XP-Log))) )
		(<tag> 'a (cons "href" "/work-log") "Full work history...") )

	(<div> '("style" . "clear: both"))

	(<form> NIL 'POST "/attributes?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Set character attributes")
			(FieldEdit "Name" 'text 'Name (rc "character.rc" 'Name))
			(FieldEdit "HP" 'text 'HP (or (rc "character.rc" 'HP) 100))
			(FieldEdit "XP" 'text 'XP (or (rc "character.rc" 'XP) 0))
			(<button> NIL 'submit 'action "set-character-attributes"
				(<span> NIL "Save character") ) ) )

	(<form> NIL 'POST "/weapon?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust weapon")
			(FieldEdit "Name" 'text 'Weapon-Name (rc "character.rc" 'Weapon-Name))
			(FieldEdit "Attack" 'text 'Weapon-Attack (or (rc "character.rc" 'Weapon-Attack) 10))
			(<button> NIL 'submit 'action "set-weapon"
				(<span> NIL "Save weapon") ) ) )

	(<form> NIL 'POST "/armor?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust armor")
			(FieldEdit "Name" 'text 'Armor-Name (rc "character.rc" 'Armor-Name))
			(FieldEdit "Defense" 'text 'Armor-Defense (or (rc "character.rc" 'Armor-Defense) 5))
			(<button> NIL 'submit 'action "set-armor"
				(<span> NIL "Save weapon") ) ) )

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
