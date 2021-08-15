(setq display-buffer-alist
      `(("\\*Ibuffer.*"
         (display-buffer-in-side-window)
	 (inhibit-same-window t)
         (side . left)
         (slot . 0)
         (window-width . 25)
         ;(reusable-frames . nil)
	 )
	("\\*Help.*"
         (display-buffer-in-side-window)
         (window-width . 0.3)
         (side . left)
         (slot . -1))
	))
