(rc ".busyrpg/character.rc" 'Name (get '*RequestPost 'Name))
(rc ".busyrpg/character.rc" 'HP (format (get '*RequestPost 'HP)))
(rc ".busyrpg/character.rc" 'XP (format (get '*RequestPost 'XP)))
(rc ".busyrpg/character.rc" 'Township (get '*RequestPost 'Township))

(redirect "/index")
