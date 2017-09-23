(defun set-tab-width (w)
	`(lambda ()
		 (setq indent-tabs-mode t)
		 (setq tab-width ,w)))

(let ((tab-width-2 (set-tab-width 2)))
	(funcall tab-width-2)
	(add-hook 'emacs-lisp-mode-hook tab-width-2)
	(add-hook 'lisp-mode-hook tab-width-2)
	(add-hook 'scheme-mode-hook tab-width-2))

(let ((tab-width-4 (set-tab-width 4)))
	(add-hook 'sh-mode-hook tab-width-4)
	(add-hook 'perl-mode-hook tab-width-4))

(let ((tab-width-8 (set-tab-width 8)))
	(add-hook 'c-mode-hook tab-width-8))

(provide 'init-indentation)
