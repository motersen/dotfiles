(setq rcirc-server-alist
			'(("irc.freenode.net" :port 6697 :encryption tls
				 :channels ("#freenode"))))

(setq rcirc-authinfo
			'(("freenode" nickserv "motersen" rcirc-get-password)))

(setq rcirc-omit-responses '("JOIN" "PART" "QUIT"))

(add-hook 'rcirc-mode-hook
					(lambda ()
						(set (make-local-variable 'scroll-conservatively)
								 8192)))

(defun rcirc-get-password (host nick)
	(replace-regexp-in-string "\n\\'" ""
														(shell-command-to-string (format "pass %s/%s" nick host))))

(defun rcirc-replace-passwords (rcirc-authenticate &rest args)
	(let (full-authinfo)
		(dolist (record rcirc-authinfo)
			(setq full-authinfo (cons
													 (let ((method (nth 1 record))
																 (password (nth 3 record)))
														 (if (and (not (eq method 'chanserv))
																			(functionp password))
																 (let ((host (nth 0 record))
																			 (nick (nth 2 record)))
																	 (append
																		(list host
																					method
																					nick
																					(funcall password host nick))
																		(nthcdr 4 record)))
															 record))
													 full-authinfo)))
		(let ((rcirc-authinfo full-authinfo))
			(funcall rcirc-authenticate))))

(advice-add 'rcirc-authenticate :around #'rcirc-replace-passwords)

(provide 'init-rcirc)
