(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(setq ibuffer-expert nil) ;maybe-later-uh
(setq ibuffer-display-summary nil)
(setq ibuffer-use-other-window nil)
(setq ibuffer-show-empty-filter-groups nil)
;;(setq ibuffer-movement-cycle nil)
(setq ibuffer-default-sorting-mode 'filename/process)
(setq ibuffer-use-header-line t)
(setq ibuffer-default-shrink-to-minimum-size nil) ;hmmmm
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 16 20 :left :elide))
        (mark modified read-only locked " "
              (name 40 40 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "deffault")))

(setq ibuffer-saved-filter-groups
      '(("deffault"
	 ("emacs" (or
	  (saved . "vc")
	  (saved . "emacs")))
	 ("test" (or
	  (saved . "agenda")
	  (saved . "dired"))))))

(setq ibuffer-saved-filters
      '(("vc" (or (mode . svn-status-mode)
                  (mode . svn-log-edit-mode)
                  (name . "^\\*Annotate")
                  (name . "^\\*git-")
                  (name . "^\\*magit:")
                  (name . "^\\*magit-")
                  (name . "^\\*svn-")
                  (name . "^\\*vc-")
                  (name . "^\\*vc\\*$")))
        ("emacs" (or (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                      (name . "^\\*ELP Profiling Results\\*$")
                      (name . "^TAGS\\(<[0-9]+>\\)?$")
                      (name . "^\\*Help\\*$")
                      (name . "^\\*info\\*$")
                      (name . "^\\*Occur\\*$")
                      (name . "^\\*grep\\*$")
                      (name . "^\\*Apropos\\*$")
                      (name . "^\\*Compile-Log\\*$")
                      (name . "^\\*Backtrace\\*$")
                      (name . "^\\*Packages\\*$")
                      (name . "^\\*Process List\\*$")
                      (name . "^\\*gud\\*$")
                      (name . "^\\*Man")
                      (name . "^\\*WoMan")
                      (name . "^\\*Kill Ring\\*$")
                      (name . "^\\*Completions\\*$")
                      (name . "^\\*tramp")
                      (name . "^\\*shell\\*$")
                      (mode . term-mode)
                      (name . "^\\*compilation\\*$")
                      (mode . Custom-mode)))
         ("agenda" (or (name . "^\\*Calendar\\*$")
                       (name . "^diary$")
                       (name . "^\\*Agenda")
                       (name . "^\\*org-")
                       (name . "^\\*Org")
                       (mode . org-mode)
                       (mode . muse-mode)))
         ("dired" (or (mode . dired-mode)))
	 ("programming"
	  (or
	   (derived-mode . prog-mode)
	   (mode . ess-mode)
	   (mode . compilation-mode)))))

      

;(setq ibuffer-saved-filter-groups nil)

;;(setq ibuffer-saved-filter-groups
;;      '(("home"
;;	 ("emacs-config" (or (filename . ".emacs.d")
;;			     (filename . "emacs-config")
;;			     (name . "^\\*\\(scratch\\|Messages\\)\\*$"))
;;          ("Dired" (mode . dired-mode))
;;	  ("Org" (or (mode . org-mode)
;;		     (filename . "OrgMode")))
;;          ("code" (filename . "code"))
;;	  ("Web Dev" (or (mode . html-mode)
;;			 (mode . css-mode)))
;;	  ("Documentation" (name . "^\\*\\(Help\\|info\\|Man [0-9]?\\)"))
;;	  ("Magit" (name . "\*magit"))
;;	  ("ERC" (mode . erc-mode))
;;	  ("Help" (or (name . "\*Help\*")
;;		      (name . "\*Apropos\*")
;;		      (name . "\*info\*")))
;;	  ("Special buffers"  (name-not . "compilation")
;;	   (name . "^\\*.*\\*$"))))
;;	)
;;      )
;;(setq ibuffer-old-time 48)






;;(add-hook 'ibuffer-mode-hook
;;	  (lambda ()
;;	    (face-remap-add-relative 'default '(:family "Monospace"))
;;	    )
;;	  )
