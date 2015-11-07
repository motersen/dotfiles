;; Indentation

(defun set-tab-width (w)
  `(lambda ()
     (setq tab-width ,w)))

(let ((tab-width-2 (set-tab-width 2)))
  (funcall tab-width-2)
  (add-hook 'emacs-lisp-mode-hook tab-width-2)
  (add-hook 'lisp-mode-hook tab-width-2)
  (add-hook 'scheme-mode-hook tab-width-2))

;;; Appearance

; disable scroll-, tool-, and menu-bar
(if (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(load-theme 'tango-dark)
