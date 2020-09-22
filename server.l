(de my-htHead ()
	(char)
	(setq *RequestUrl (till " " T))
	(char)
	(setq *RequestHttpVersion (till "^M^J" T))
	(line)
		# now the headers
	(while
		(case (lowc (till " ^M^J" T))
			("host:" (setq *RequestHost (glue "" (cdr (line)))))
			("referer:" (setq *RequestReferer (glue "" (cdr (line)))))
			("content-length:" (setq *RequestContentLength (format (glue "" (cdr (line))))))
			(T (if (eol) (char) (line T))) ) )

	(let (a (chop *RequestUrl) i (or (index "?" a) (inc (length a))))
		(setq *RequestPathname (glue "" (head (dec i) a)))
		(setq *RequestQuery (glue "" (tail (- i) a)))
	)

	(my-htQuery *RequestQuery)
)

(de _my-htQuerySegment (segment GlobalVar)
	(put GlobalVar
		(intern (ht:Pack (replace (car (split segment "=")) "+" " ") T))
		(ht:Pack (replace (cadr (split segment "=")) "+" " ") T) )
#(show '*RequestGet)
)

(de my-htQuery (query)
	(mapcar
		'( (tx)
			(_my-htQuerySegment tx '*RequestGet))
		(split (chop query) "&") ) )

(de my-htPayload ()
	(setq *RequestPayload
		(if *RequestContentLength
			(glue "" (ht:Read *RequestContentLength))
			(line T) ) )

	(mapcar
		'( (tx)
			(_my-htQuerySegment tx '*RequestPost))
		(split (chop *RequestPayload) "&") )
)

(de server-dump-debug ()
	(prinl "*RequestMethod:" *RequestMethod "; *RequestHttpVersion:" *RequestHttpVersion)
	(prinl "*RequestUrl:" *RequestUrl "; *RequestPathname:" *RequestPathname "; *RequestQuery:" *RequestQuery)
	(prinl "*RequestHost:" *RequestHost)
	(prinl "*RequestPayload:" *RequestPayload)
	(prinl "*RequestContentLength:" *RequestContentLength)
	(show '*RequestHeadersSingular)
)

(de my-server (WebRoot AvailablePages AssetsRoot AvailableAssets)
	(off *RequestMethod *RequestHttpVersion
		*RequestUrl # whole uri
			*RequestPathname # pathname part of uri, without the trailing "?"
			*RequestQuery # query string part of uri, without the leading "?"
		*RequestGet # the parsed/interpreted query, access with (get)
		*RequestPost # the parsed/interpreted POST payload, access with (get)
		*RequestHost *RequestReferer *RequestContentLength
		*RequestPayload # request payload string
		*RequestHeadersSingular # this is technically wrong, because some headers can be repeated
	)

	(in NIL
		(case (setq *RequestMethod (till " " T))
			("GET" (my-htHead))
			("POST" (my-htHead) (my-htPayload))
			(T (prinl "unsupported HTTP method: \"" @ "\"") (bye))
		)
	)

#	(server-dump-debug)

	(let (
		local (pack (tail -1 (chop *RequestPathname)))
		asset (text "@1/@2" AssetsRoot local)
		canon (text "@1-@2", *RequestMethod local)
		canon (if (= canon "GET-")
			(car AvailablePages)
			canon )
		filepn (text "@1/@2.l", WebRoot canon) )

		(when (index local AvailableAssets)
			(serve-one-file asset)
			(bye) )

		(when (index canon AvailablePages)
			(script filepn)
			(bye) )

		(http-response-not-found) )
)

(de serve-one-file (pathname)
	(http-status-ok)
	(mapcar wr (in pathname
		(make
			(while (rd 1)
				(link @) ) ) ) )
	(bye)
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
