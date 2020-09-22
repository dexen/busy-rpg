(rc "character.rc" 'XP
	(+ (or (rc "character.rc" 'XP) 0) (format (get '*RequestPost 'xp-gain))))

(redirect "/index")
