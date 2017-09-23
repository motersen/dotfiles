;; disable clipboard integration
(setq x-select-enable-clipboard-manager nil)

;; follow symlinks to version-controlled files
(setq vc-follow-symlinks t)

;; Always kill line through newline
(setq kill-whole-line t)

(put 'upcase-region 'disabled nil)

(provide 'init-editor)
