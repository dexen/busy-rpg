(rc "character.rc" 'Name (get '*RequestPost 'Name))
(rc "character.rc" 'HP (format (get '*RequestPost 'HP)))

(redirect "/index")
