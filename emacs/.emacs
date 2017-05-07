;; Mode detection

(add-to-list 'auto-mode-alist '("PKGBUILD" . sh-mode))

;; Indentation

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

(setq c-default-style "k&r"
			c-basic-offset 8)

(add-hook 'markdown-mode-hook (lambda () (auto-fill-mode 72)))

(add-hook 'scheme-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)

;;; Options

(defadvice find-file (after find-file-sudo activate)
	"Find file as root if necessary."
	(unless (and buffer-file-name
							 (file-writable-p buffer-file-name))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; disable clipboard integration
(setq x-select-enable-clipboard-manager nil)

;; follow symlinks to version-controlled files
(setq vc-follow-symlinks t)

(put 'upcase-region 'disabled nil)

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

;; Packages

(require 'package)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(clojars markdown-mode paredit gitconfig-mode git-commit-insert-issue git-commit geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
