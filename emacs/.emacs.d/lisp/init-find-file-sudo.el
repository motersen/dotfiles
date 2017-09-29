(defun find-file-sudo (buffer-file-name &optional wildcards)
	"Find file as root if necessary."
	(when (and buffer-file-name
						 (file-exists-p buffer-file-name)
						 (not (file-writable-p buffer-file-name)))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(advice-add 'find-file :after #' find-file-sudo)

(provide 'init-find-file-sudo)
