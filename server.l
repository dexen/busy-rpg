(de my-htHead ()
	(char)
	(setq *RequestUrl (till " " T))
	(char)
	(setq *RequestHttpVersion (till "^M^J" T))
	(line)
		# now the headers
	(while
		(case (lowc (till " ^M^J" T))
			("host:" (setq *RequestHost (cdr (line))))
			("referer:" (setq *RequestReferer (cdr (line))))
			(T (if (eol) (char) (line T))) ) )

	(let (a (chop *RequestUrl) i (index "?" a))
		(setq *RequestPathname (glue "" (head (dec i) a)))
		(setq *RequestQuery (glue "" (tail (- i) a)))
	)
)

(de server-dump-debug ()
	(prinl "*RequestMethod:" *RequestMethod "; *RequestHttpVersion:" *RequestHttpVersion)
	(prinl "*RequestUrl:" *RequestUrl "; *RequestPathname:" *RequestPathname "; *RequestQuery:" *RequestQuery)
	(prinl "*RequestHost:" *RequestHost)
	(prinl "*RequestPayload:" *RequestPayload)
)

(de my-server (WebRoot AvailablePages)
	(off *RequestMethod *RequestHttpVersion
		*RequestUrl *RequestPathname *RequestQuery
		*RequestHost *RequestReferer
		*RequestPayload *RequestData)

	(in NIL
		(case (setq *RequestMethod (till " " T))
			("GET" (my-htHead))
			("POST" (my-htHead))
			(T (prinl "unsupported HTTP method") (bye))
		)
	)

#	(server-dump-debug)

	(let (
		canon (text "@1-@2", *RequestMethod (pack (tail -1 (chop *RequestPathname))))
		filepn (text "@1/@2.l", WebRoot canon) )

		(if (index canon AvailablePages)
			(script filepn)
			(http-response-not-found) ) )
)

(de http-status (code message)
	(prinl (text "@1 @2 @3" *RequestHttpVersion, code, message))
	(prinl "")
)

(de http-response (code message)
	(http-status code message)
	(prinl "<!DOCTYPE html>")
	(prinl "<html>")
	(prinl "<head>")
	(prinl (text "	<title>HTTP @1 @2</title>" code message))
	(prinl "</head>")
	(prinl "<body>")
	(prinl (text "<center><h1>HTTP @1 @2</h1></center>" code message))
)

(de http-status-ok ()
	(http-status 200 "OK")
)

(de http-response-not-found ()
	(http-response 404 "Not Found")
)
