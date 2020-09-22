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

	(<tag> 'fieldset NIL
		(<tag> 'legend NIL "Current character")
		(<p> NIL
			(Finfo "Name:" (rc "character.rc" 'Name))
			(Finfo "XP:" (+ (rc "character.rc" 'XP) 0)) ) )

	(<form> NIL 'POST "/attributes?xyz=123&foo=bar"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Change attributes")
			(FieldEdit "Name" 'text 'Name (rc "character.rc" 'Name))
			(<button> NIL 'submit 'action "xp-gain"
				(<span> NIL "Save character") ) ) )

	(<form> NIL 'POST "/xp-gain?foo=bar&aa=bb"
		(<tag> 'fieldset NIL
			(<tag> 'legend NIL "Adjust XP")
			(FieldEdit "XP to add" 'text 'xp-gain 1)
			(<button> NIL 'submit 'action "xp-gain"
				(<span> NIL "Add XP") ) ) ) )
