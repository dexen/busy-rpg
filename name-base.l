(setq *Katakana
#
# kana tool
# http://www.romajidesu.com/romaji_kana/totto
#

	'(
#	n	#	germinate	#	after long vowel	# reduplicates and unvoices	#	reduplicates and voices
		(()	ン	ッ	ー	ヽ	ヾ)

#		(()	a	i	u	e	o	ya	yu	yo)
		(∅	a	i	u	e	o)
		(K	ka	ki	ku	ke	ko	kya	kyu	kyo)
		(S	sa	shi	su	se	so	sha	shu	sho)
		(T	ta	chi	tsu	te	to	cha	chu	cho)
		(N	na	ni	nu	ne	no	nya	nyu	nyo)
		(H	ha	hi	fu	he	ho	hya	hyu	hyo)
		(M	ma	mi	mu	me	mo	mya	myu	myo)
		(Y	ya	()	yu	()	yo)
		(R	ra	ri	ru	re	ro	rya	ryu	ryo)
		(W	wa	wi	()	we	wo)

		(G	ga	gi	gu	ge	go	gya	gyu	gyo)
		(Z	za	ji	zu	ze	zo	ja	ju	jo)
		(D	da	ji	zu	de	do	ja	ju	jo)
		(B	ba	bi	bu	be	bo	bya	byu	byo)
		(P	pa	pi	pu	pe	po	pya	pyu	pyo) ) )

(setq *KatakanaLinear
	(make (mapcar chain (mapcar cdr (nth *Katakana 1))))
)

(de random-katakana-word ()
		(str-ucfirst
			(mapcar
				'((N) (get *KatakanaLinear (random-integer N)))
				(need (random-integer 2 7) (length *KatakanaLinear)) ) ) )
