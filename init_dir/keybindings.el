;;(let ((map ibuffer-mode-map))
;;  (define-key map (kbd "* f") #'ibuffer-mark-by-file-name-regexp)
;;  (define-key map (kbd "* g") #'ibuffer-mark-by-content-regexp) ; "g" is for "grep"
;;  (define-key map (kbd "* n") #'ibuffer-mark-by-name-regexp)
;;  (define-key map (kbd "s n") #'ibuffer-do-sort-by-alphabetic)  ; "sort name" mnemonic
;;  (define-key map (kbd "/ g") #'ibuffer-filter-by-content))

(define-key global-map [(meta i)] ctl-x-map)
(define-key global-map (kbd "M-u") #'universal-argument)
(define-key global-map (kbd "M-z") #'mine-buffer-switch)
(define-key global-map (kbd "M-o") #'mine-other-window-and-deletes)
;(define-key global-map (kbd "M-(") #'delete-other-windows)
;(define-key global-map (kbd "M-*") #'delete-window)
(define-key global-map (kbd "M-/") #'mine-undo)
;;(define-key global-map (kbd "M-?") #')
(global-set-key (kbd "M-$") 'mine-split-and-swap)
(global-set-key (kbd "M-i k") 'mine-kill-buffer-maybe-window)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(defun minecustomfnname (arg)
  "Template.Display the value of the raw prefix arg."
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (message "No prefix: %s" arg))
    ((> arg 1) ;; Positive argument
      (message "Positive argument %s" arg))
    ((< arg 0) ;; Negative argument
     (message "Negative argument %s" arg))))

(defun mine-other-window-and-deletes (arg)
  "Switch to other window.
Positive arg - delete-window
Negative arg - delete-other-window"
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (other-window 1))
    ((> arg 1) ;; Positive argument
      (delete-window))
    ((< arg 0) ;; Negative argument
      (delete-other-windows))))

(defun mine-split-and-swap (arg)
  "Swap-windows-states.
Positive arg - split-window-right
Negative arg - split-window-below"
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (window-swap-states))
    ((> arg 1) ;; Positive argument
      (split-window-right))
    ((< arg 0) ;; Negative argument
      (split-window-below))))

(defun mine-undo (arg)
  "Undo. With positive argument Redo, with negative - undo-tree-visualize"
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (undo-tree-undo))
    ((> arg 1) ;; Positive argument
      (undo-tree-redo))
    ((< arg 0) ;; Negative argument
      (undo-tree-visualize))))

(defun mine-kill-buffer-maybe-window (arg)
  "Kill buffer, with negative argument buffer and window"
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (ido-kill-buffer))
    ((> arg 1) ;; Positive argument
      (message "empty binding" arg))
    ((< arg 0) ;; Negative argument
      (kill-buffer-and-window))))

(defun mine-buffer-switch (arg)
  "Switch buffers. With negative argument - Ibuffer, with positive - switch-buffer-other-window"
  (interactive "p")
    (cond
    ((equal arg 1) ;; no prefix
      (ido-switch-buffer))
    ((> arg 1) ;; Positive argument
     (ido-switch-buffer-other-window))
    ((< arg 0) ;; Negative argument
      (list-buffers))))


;; Useful script to display known modes keybindings
(require 's)
(defun list-known-bindings (key)
  (interactive "kList known bindings for key: ")
  (with-current-buffer (get-buffer-create "*known bindings*")
    (erase-buffer)
    (mapatoms (lambda (sym)
                (when (or (eq sym 'global-map)
                          (and (boundp sym)
                               (symbol-value sym)
                               (s-ends-with-p "-mode-map" (symbol-name sym))
                               (keymapp (symbol-value sym))))
                  (let ((binding (lookup-key (symbol-value sym) key t)))
                    (when (and binding
                               (not (numberp binding)))
                      (insert (format "%-40s `%s'\n"
                                      (format "`%s'" sym)
                                      (if (keymapp binding)
                                          "KEYMAP"
                                        binding))))))))
    (sort-lines nil (point-min) (point-max))
    (goto-char (point-min))
    (insert
     (format "Known bindings for key: %s\n\n" (key-description key))
     (format "%-40s %s" "Map" "Binding\n")
     (s-repeat 40 "-") " " (s-repeat 30 "-") "\n") 
    (display-buffer (current-buffer))))
