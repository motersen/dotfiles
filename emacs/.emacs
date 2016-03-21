;; Indentation

(defun set-tab-width (w)
	`(lambda ()
		 (setq tab-width ,w)))

(let ((tab-width-2 (set-tab-width 2)))
	(funcall tab-width-2)
	(add-hook 'emacs-lisp-mode-hook tab-width-2)
	(add-hook 'lisp-mode-hook tab-width-2)
	(add-hook 'scheme-mode-hook tab-width-2))

(let ((tab-width-4 (set-tab-width 4)))
	(add-hook 'shell-script-mode tab-width-4))

(defadvice find-file (after find-file-sudo activate)
	"Find file as root if necessary."
	(unless (and buffer-file-name
							 (file-writable-p buffer-file-name))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; disable clipboard integration
(setq x-select-enable-clipboard-manager nil)

;; mode-hooks

(add-hook 'scheme-mode-hook #'paredit-mode)

;;; Appearance

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

(load-theme 'tango-dark)

; don't show the start screen
(setq inhibit-startup-screen t)

;; ELPA Repos

(require 'package)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
