; disable scroll-, tool-, and menu-bar
(if (fboundp 'scroll-bar-mode)
	(scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
	(menu-bar-mode -1))

; display line numbers on the left
(global-linum-mode)
; display column number in modeline
(column-number-mode)

; only blink cursor 3 times
(setq blink-cursor-blinks 3)
; stretch cursor over wide characters (tabs)
(setq x-stretch-cursor t)
; blink off as horizontal bar when using box cursor
(add-to-list 'blink-cursor-alist '(box . hbar))
(setq-default cursor-type 'box)

(load-theme 'tango-dark)

; don't show the start screen
(setq inhibit-startup-screen t)

(provide 'init-gui)
