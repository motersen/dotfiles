;; start terminal client
(xbindkey '(Mod4 Shift Return) "termite")

;; launch emacs
(xbindkey '(Control Mod1 e) "termite -e \"$EDITOR\"")

;; launch surf
(xbindkey '(Mod4 s) "surf-tabbed")

;; watch youtube video link in x selection
(xbindkey '(Mod4 y) "yt \"$(xclip -o)\"")

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

;; paste password
(xbindkey '(Mod4 v) "passmenu -l 5 && xdotool type \"$(xclip -selection clipboard -o)\"")

;; screenshot
(xbindkey-function 'Print
	(lambda ()
		(let ((t (gettimeofday)))
			(run-command
				(string-append "scrot " "~/screenshots/"
					(number->string (car t)) (number->string (cdr t))
					".png")))))

;;; change background

;; Mod-w [0,1)s Mod-r: set new filter
;; Mod-w [0,1)s Mod-w: next wallpaper in current filter
(let ((time 0)
			(count 0))
	(xbindkey-function '(Mod4 release r)
										 (lambda ()
											 (if (> count 0)
													 (let ((interval (- (current-time) time)))
														 (if (< interval 1)
																 (begin
																	 (run-command "potbg filter")
																	 (set! count 0)))))))
	(xbindkey-function '(Mod4 release w)
										 (lambda ()
											 (if (> count 0)
													 (let ((interval (- (current-time) time)))
														 (if (< interval 1)
																 (begin
																	 (run-command "potbg")
																	 (set! count 0))))
													 (set! count 1))
											 (set! time (current-time)))))
