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

	(<form> NIL 'POST "/xp-gain?foo=bar&aa=bb"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust XP")
			(FieldEdit "XP to add" 'text 'xp-gain 1)
			(<button> NIL 'submit 'action "xp-gain"
				(<span> NIL "Add XP") ) ) ) )
