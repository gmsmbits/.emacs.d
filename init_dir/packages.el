;;;;;;;;;;;;;;;;;;;; NO USE-PACKAGE BEFORE THIS LINE ;;;;;;;;;;;;;;;;;;;;
;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Anzu (isearch results count)
(use-package anzu
  :init (global-anzu-mode +1)
  :ensure t
  )

(use-package which-key
  :ensure t
  :init (which-key-mode)
  ;; default
  ;;(setq which-key-sort-order 'which-key-key-order)
  ;; same as default, except single characters are sorted alphabetically
  ;; (setq which-key-sort-order 'which-key-key-order-alpha)
  ;; same as default, except all prefix keys are grouped together at the end
  ;; (setq which-key-sort-order 'which-key-prefix-then-key-order)
  ;; same as default, except all keys from local maps shown first
  ;; (setq which-key-sort-order 'which-key-local-then-key-order)
  ;; sort based on the key description ignoring case
;;  Face	Applied To	Default Definition
;;which-key-key-face,                   Every key sequence,            :inherit font-lock-constant-face                         
;;which-key-separator-face,             The separator (→),             :inherit font-lock-comment-face                          
;;which-key-note-face,                  Hints and notes,               :inherit which-key-separator-face                        
;;which-key-special-key-face,           User-defined special keys,     :inherit which-key-key-face :inverse-video t :weight bold
;;which-key-group-description-face,     Command groups (i.e, keymaps), :inherit font-lock-keyword-face                          
;;which-key-command-description-face,   Commands not in local-map,     :inherit font-lock-function-name-face                    
;;which-key-local-map-description-face, Commands in local-map,         :inherit which-key-command-description-face              

  (setq which-key-sort-order 'which-key-description-order)
  (set-face-attribute 'which-key-key-face nil  :family "Monospace" :font "Hack")
  (set-face-attribute 'which-key-separator-face nil :family "Monospace" :font "Hack")
;;  (set-face-attribute 'which-key-note-face nil :family "Monospace" :font "Hack")
;;  (set-face-attribute 'which-key-special-key-face nil :family "Monospace" :font "Hack")
  (set-face-attribute 'which-key-group-description-face nil :family "Monospace" :font "Hack")
  (set-face-attribute 'which-key-command-description-face nil :family "Monospace" :font "Hack")
;;  (set-face-attribute 'which-key-local-map-description-face nil :family "Monospace" :font "Hack")
  )

;; Smex
(use-package smex
  :init (smex-initialize)
  :ensure t
  :bind ("M-x" . smex))


(use-package plantuml-mode
  :ensure t
  :config
  (progn
 (setq plantuml-jar-path (expand-file-name "/usr/share/plantuml/lib/plantuml.jar")
  )))


(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status))
  :config
  (progn
    (defun inkel/magit-log-edit-mode-hook ()
      (setq fill-column 72)
      (flyspell-mode t)
      (turn-on-auto-fill))
    (add-hook 'magit-log-edit-mode-hook 'inkel/magit-log-edit-mode-hook)
    (defadvice magit-status (around magit-fullscreen activate)
      (window-configuration-to-register :magit-fullscreen)
      ad-do-it
      (delete-other-windows))
    (setq vc-handled-backends nil)
    ))

(use-package exec-path-from-shell ;; for fresh Git to work in Magit
  :ensure t
  :init
     (when (memq window-system '(mac ns))
       (exec-path-from-shell-initialize))
)

(use-package browse-kill-ring
  :ensure t
  :init
  (browse-kill-ring-default-keybindings))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package ace-jump-mode
  :diminish ace-jump-mode
  :config (progn
            (autoload
              'ace-jump-mode
              "ace-jump-mode"
              "Emacs quick move minor mode"
              t)
            ;; you can select the key you prefer to
            ;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode
            (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))
  :ensure t)

(use-package key-chord
  :ensure t
  :init
  (key-chord-mode +1)
  :config
  (progn
    (key-chord-define-global "bb" 'er/expand-region)
    (key-chord-define-global "gg" 'ace-jump-mode)
    (key-chord-define-global "jk" 'beginning-of-buffer))
  ;;      fb
  ;;      gb gp
  ;;  jj  jc jf jg jh jk jl jm jp jq js jt jv jw jx jy jz
  ;;  kk
  ;;  qq  qb qf qg qh qk ql qm qp qt qv qw qx qy qz
  ;;  vv  vc vf vg vh vk vm vp vw vz
  ;;  ww
  ;;      xb xd xg xk xm xs xw
  ;;  yy
  ;;      zb zd zf zg zk zm zp zs zw zx
)

(use-package gruvbox-theme
  :ensure t)

(use-package expand-region
;;  :init
;;  (global-set-key (kbd "C-=") 'er/expand-region)
  :ensure t)
;;(require 'expand-region)
;;(global-set-key (kbd "C-c =") 'er/expand-region)


;; IDO-vertical mode
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)


(use-package dired
  :commands (dired-toggle-read-only ; to toggle read-only state of any buffer
             dired-get-filename) ; called by `dired-single'
  :config
  (progn
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies  'always)
    ;; Set this variable to non-nil, Dired will try to guess a default
    ;; target directory. This means: if there is a dired buffer
    ;; displayed in the next window, use its current subdir, instead
    ;; of the current subdir of this dired buffer. The target is used
    ;; in the prompt for file copy, rename etc.
    (setq dired-dwim-target t)

    ;; Dired listing switches
    ;;  -a : Do not ignore entries starting with .
    ;;  -l : Use long listing format.
    ;;  -G : Do not print group names like 'users'
    ;;  -h : Human-readable sizes like 1K, 234M, ..
    ;;  -v : Do natural sort .. so the file names starting with . will show up first.
    ;;  -F : Classify filenames by appending '*' to executables,
    ;;       '/' to directories, etc.
    (when (eq system-type 'darwin)
      (setq insert-directory-program "gls"))
    
    (setq dired-listing-switches "-alGhvF --group-directories-first")
    )) ; default: "-al"

    (defun modi/dired-rename-buffer-name ()
      "Rename the dired buffer name to distinguish it from file buffers. It added extra strings at the front and back of the default dired buffer name."
      (let ((name (buffer-name)))
        (if (not (string-match "/$" name))
            (rename-buffer (concat "*Dired* " name "/") t))))

    (defun modi/dired-truncate-lines ()
      (toggle-truncate-lines 1))

;;    (add-hook 'dired-mode-hook #'modi/dired-rename-buffer-name)
;;    (add-hook 'dired-mode-hook #'modi/dired-truncate-lines)

(use-package darktooth-theme
  :ensure t
  )
