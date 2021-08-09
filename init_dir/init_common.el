(set-language-environment "UTF-8")
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq scroll-preserve-screen-position t)
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

(setq locale-coding-system 'utf-8)
(setq mac-command-modifier 'meta)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Gtypist mode
(autoload 'gtypist-mode "~/.emacs.d/gtypist-mode.el")
(setq auto-mode-alist
      (cons '("\\.typ\\'" . gtypist-mode) auto-mode-alist))

(global-hl-line-mode t)
;;(set-face-background 'hl-line "#1F3333")

(setq electric-pair-pairs '(
                           (?\{ . ?\})
                           (?\( . ?\))
                           (?\[ . ?\])
                           (?\" . ?\")
                           ))
(electric-pair-mode t)
(defvar my-electic-pair-modes '(python-mode org-mode gtypist-mode))
(defun my-inhibit-electric-pair-mode (char)
  (not (member major-mode my-electic-pair-modes)))
(setq electric-pair-inhibit-predicate #'my-inhibit-electric-pair-mode)


;; IDO mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;if the value is ‘lazy’, the *Completions* buffer is only displayed after
;;the second failed attempt to complete.
(setq compleation-auto-help 'lazy)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

;;; scrollers

;; TERMINAL MAPPINGS TO SUPPORT ITERM2 FOR MAC
;; in iTerm "preferences -> profiles -> keys" add corresponding mapping
;; 'Action "Send Escape Sequence" [1;P10
(progn
  (let ((map (if (boundp 'input-decode-map)
		 input-decode-map
	       function-key-map)))
    (define-key map "\e[1;P9"  (kbd "C-S-P"))
    (define-key map "\e[1;P10" (kbd "C-S-N"))
    (define-key map "\e[1;P11" (kbd "C-?"))
    (define-key map "\e[1;P12" (kbd "M-?"))
    
    ))

(global-set-key (kbd "C-S-N") (lambda () (interactive) (scroll-up 3) (next-line 3)) )
(global-set-key (kbd "C-S-P") (lambda () (interactive) (scroll-down 3)(previous-line 3)) )
(show-paren-mode t)

(add-hook 'dired-mode-hook
	  (lambda ()
	    (face-remap-add-relative 'default '(:family "Monospace"))
	    (dired-hide-details-mode 1)
	    (define-key dired-mode-map (kbd "^")
	      (lambda () (interactive) (find-alternate-file "..")))
	; was dired-up-directory
	    )
	  )

(add-hook 'which-key-mode-hook
	  (lambda ()
	    (print "ololo")
;;	    (face-remap-add-relative 'which-key-key-face '(:family "Monospace"))
;;	    (face-remap-add-relative 'which-key-separator-face '(:family "Monospace"))
;;	    (face-remap-add-relative 'which-key-group-description-face '(:family "Monospace"))
;;	    (face-remap-add-relative 'which-key-command-description-face '(:family "Monospace"))
;;	    (face-remap-add-relative 'which-key-command-description-face '(:family "Hack"))
;;	    (face-remap-add-relative 'default '(fixed-pitch))
	   (face-remap-add-relative 'default '(:family "Monospace")) 
	    )
	  )

;;(add-hook 'ibuffer-mode-hook
;;	  (lambda ()
;;	    (face-remap-add-relative 'default '(:family "Monospace"))
;;	    )
;;	  )
