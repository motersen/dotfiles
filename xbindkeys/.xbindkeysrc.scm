;; start terminal client
(xbindkey '(Mod4 Shift Return) "termite")

;; launch emacs
(xbindkey '(Control Mod1 e) "emacs")

;; launch surf
(xbindkey '(Mod4 s) "surf-run")

;; launcher
(xbindkey '(Mod4 d) "dmenu-run")

;; lock screen
(xbindkey '(Control Mod4 l) "lockscreen")

;; suspend
(xbindkey '(Control Mod4 s) "lockscreen && systemctl suspend")

;; hibernate
(xbindkey '(Control Mod4 h) "lockscreen && systemctl hibernate")

;; shutdown
(xbindkey '(Control Mod4 Return) "systemctl poweroff")

;; reboot
(xbindkey '(Control Mod4 Shift_R) "systemctl reboot")

;; screenshot
(xbindkey-function 'Print
	(lambda ()
		(let ((t (gettimeofday)))
			(run-command
				(string-append "scrot " "~/Bilder/screenshots/"
					(number->string (car t)) (number->string (cdr t))
					".png")))))

;;; change background

(define (reset-bg-bindings)
	(remove-xbindkey '(f))
	(remove-xbindkey '(Mod4 f))
	(remove-xbindkey '(Control g)))

;; set new background filter
(define (filter-bg)
	(reset-bg-bindings)
	(run-command "potbg filter"))

;; next background in current filter
(define (next-bg)
	(reset-bg-bindings)
	(run-command "potbg"))

;; M-w f: new filter
;; M-w M-f: next background
;; C-g: reset
(xbindkey-function '(Mod4 release w)
									 (lambda ()
										 (xbindkey-function '(f) filter-bg)
										 (xbindkey-function '(Mod4 f) next-bg)
										 (xbindkey-function '(Control g) reset-bg-bindings)))
