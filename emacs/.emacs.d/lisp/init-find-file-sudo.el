(defadvice find-file (after find-file-sudo activate)
	"Find file as root if necessary."
	(unless (and buffer-file-name
							 (file-writable-p buffer-file-name))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(provide 'init-find-file-sudo)
