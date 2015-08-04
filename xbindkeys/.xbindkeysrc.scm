;; end x session and log out
(define (xlogout)
	(run-command "i3-msg exit"))


;;; BINDINGS

;; start terminal client
(xbindkey '(Mod4 Return) "urxvtc")

;; launcher
(xbindkey '(Mod4 d) "rofi-run")

;; lock screen
(xbindkey '(Control Mod4 l) "lockscreen")

;; suspend
(xbindkey '(Control Mod4 s) "lockscreen && systemctl suspend")

;; hibernate
(xbindkey '(Control Mod4 h) "lockscreen && systemctl hibernate")

;; logout
(xbindkey-function '(Control Mod4 x) xlogout)

;; shutdown
(xbindkey '(Control Mod4 Return) "systemctl poweroff")

;; reboot
(xbindkey '(Control Mod4 Shift_R) "systemctl reboot")

;; change wallpaper
(xbindkey '(Mod4 w) "feh -z --bg-fill ~/wallpapers")

;; screenshot
(xbindkey-function 'Print
	(lambda ()
		(let ((t (gettimeofday)))
			(run-command
				(string-append "scrot " "~/Bilder/screenshots/"
					(number->string (car t)) (number->string (cdr t))
					".png")))))