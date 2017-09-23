;(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(autoload 'log-edit-mode "vc/log-edit" "Major mode for editing CVS commit messages" t)
(autoload 'git-commit-mode "git-commit" "Edit Git commit messages" t)

(add-to-list 'auto-mode-alist '("PKGBUILD" . sh-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . git-commit-mode))
(add-to-list 'auto-mode-alist '("mutt-" . text-mode))

(require 'init-packages)
(require 'init-find-file-sudo)
(require 'init-indentation)
(require 'init-text-mode)
(require 'init-markdown)
(require 'init-c)
(require 'init-paredit-mode)
(require 'init-editor)
(require 'init-gui)

(require 'init-rcirc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(haskell-mode clojars markdown-mode paredit gitconfig-mode git-commit-insert-issue git-commit geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
