(if (display-graphic-p)
    (load "~/.emacs.d/init_dir/init_graphics.el")
  (load "~/.emacs.d/init_dir/init_terminal.el"))

(load "~/.emacs.d/init_dir/init_common.el")
(load "~/.emacs.d/init_dir/custom_funs.el")
(load "~/.emacs.d/init_dir/packages.el")




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" default)))
 '(gtypist-mode-hook (quote (man-fg-fix)))
 '(package-selected-packages
   (quote
    (magit browse-kill-ring undo-tree key-chord expand-region ace-jump-mode gruvbox-theme use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#262626" :foreground "lightyellow3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 170 :width normal :foundry "default" :family "default")))))

(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(load-theme 'gruvbox t)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
