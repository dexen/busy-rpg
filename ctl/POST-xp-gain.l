(rc ".busyrpg/character.rc" 'XP
	(+ (or (rc ".busyrpg/character.rc" 'XP) 0) (format (get '*RequestPost 'xp-gain))))

(redirect "/index")
