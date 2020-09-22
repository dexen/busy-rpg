(rc "character.rc" 'Name (get '*RequestPost 'Name))
(rc "character.rc" 'HP (format (get '*RequestPost 'HP)))
(rc "character.rc" 'XP (format (get '*RequestPost 'XP)))

(redirect "/index")
