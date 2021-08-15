(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
(setq confirm-kill-emacs 'yes-or-no-p)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)

;; delete the selection with a keypress
(delete-selection-mode t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; set-fontset-font seems to be deprecated
;;(set-fontset-font "fontset-default" 'cyrillic "DejaVu Sans Mono")
;;(set-fontset-font t 'cyrillic (font-spec :script 'cyrillic) nil 'append)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)



(set-face-attribute 'default nil :font "Hack-17" :background "#262626" :foreground "lightyellow3")
(set-face-attribute 'fixed-pitch nil :family "Hack" :height 1.0)
(set-face-attribute 'variable-pitch nil :family "Default" :height 1.0)

(if (display-graphic-p)
    (load "~/.emacs.d/init_dir/init_graphics.el")
  (load "~/.emacs.d/init_dir/init_terminal.el"))

(load "~/.emacs.d/init_dir/init_common.el")
(load "~/.emacs.d/init_dir/custom_funs.el")
(load "~/.emacs.d/init_dir/packages.el")
(load "~/.emacs.d/init_dir/ideish.el")
(load "~/.emacs.d/init_dir/ibuffler.el")
(load "~/.emacs.d/init_dir/keybindings.el")


;;(toggle-frame-maximized)
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
(load-theme 'gruvbox t)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
