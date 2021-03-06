(if (display-graphic-p)
    (load "~/.emacs.d/init_dir/init_graphics.el")
  (load "~/.emacs.d/init_dir/init_terminal.el"))

(load "~/.emacs.d/init_dir/init_common.el")
(load "~/.emacs.d/init_dir/custom_funs.el")
(load "~/.emacs.d/init_dir/packages.el")
(load "~/.emacs.d/init_dir/ideish.el")




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" default)))
 '(gtypist-mode-hook (quote (man-fg-fix)))
 '(ibuffer-saved-filter-groups nil)
 '(ibuffer-saved-filters
   (quote
    (("cc"
      (used-mode . c-mode))
     ("programming"
      (or
       (derived-mode . prog-mode)
       (mode . ess-mode)
       (mode . compilation-mode)))
     ("text document"
      (and
       (derived-mode . text-mode)
       (not
	(starred-name))))
     ("TeX"
      (or
       (derived-mode . tex-mode)
       (mode . latex-mode)
       (mode . context-mode)
       (mode . ams-tex-mode)
       (mode . bibtex-mode)))
     ("web"
      (or
       (derived-mode . sgml-mode)
       (derived-mode . css-mode)
       (mode . javascript-mode)
       (mode . js2-mode)
       (mode . scss-mode)
       (derived-mode . haml-mode)
       (mode . sass-mode)))
     ("gnus"
      (or
       (mode . message-mode)
       (mode . mail-mode)
       (mode . gnus-group-mode)
       (mode . gnus-summary-mode)
       (mode . gnus-article-mode))))))
 '(package-selected-packages
   (quote
    (cmake-mode amx which-key whch-key lsp-ui company-lsp ccls darktooth-theme anzu magit browse-kill-ring undo-tree key-chord expand-region ace-jump-mode gruvbox-theme use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#262626" :foreground "lightyellow3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 170 :width normal :foundry "default" :family "default")))))

;; fix for macos ls lacks of --dired unless 'brew install coreutils'
;; (when (eq system-type 'darwin)
;;   (require 'ls-lisp)
;;   (setq ls-lisp-use-insert-directory-program nil))

(load-theme 'gruvbox t)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
