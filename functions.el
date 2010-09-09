(defun maximize-frame ()
  (interactive)
  (set-frame-size (selected-frame)
                  (display-pixel-width)
                  (display-pixel-height))
  (set-frame-position (selected-frame) 0 0))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun delete-this-file ()
  (interactive)
  (or (buffer-file-name) (error "no file is currently being edited"))
  (when (yes-or-no-p "Really delete this file?")
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun delete-this-file ()
  (interactive)
  (or (buffer-file-name) (error "no file is currently being edited"))
  (when (yes-or-no-p "Really delete this file?")
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

;; functions i find useful in ruby/rails programming
(defun insert-ruby-hash-pointer ()
  (interactive)
  (insert " => "))

(defun insert-erb-skeleton (no-equals)
  "Insert an erb skeleton at point, with optional prefix argument
don't include an '='."
  (interactive "P")
  (insert "<%") (if no-equals (insert "  ") (insert "=  ")) (insert "%>")
  (backward-char 3))

(defun passenger-restart ()
  (interactive)
  (shell-command-to-string (concat "touch " (rinari-root) "tmp/restart.txt"))
  (message "Passenger restarted"))

(defun swap-window-positions ()
  "Swap the buffer positions of this window and the next one."
  (interactive)
  (let ((other-window (next-window (selected-window) 'no-minibuf)))
    (let ((other-window-buffer (window-buffer other-window))
          (other-window-hscroll (window-hscroll other-window))
          (other-window-point (window-point other-window))
          (other-window-start (window-start other-window)))
      (set-window-buffer other-window (current-buffer))
      (set-window-hscroll other-window (window-hscroll (selected-window)))
      (set-window-point other-window (point))
      (set-window-start other-window (window-start (selected-window)))
      (set-window-buffer (selected-window) other-window-buffer)
      (set-window-hscroll (selected-window) other-window-hscroll)
      (set-window-point (selected-window) other-window-point)
      (set-window-start (selected-window) other-window-start))
    (select-window other-window)))

;; keys for specific functions
(global-set-key (kbd "M-p") 'dabbrev-expand)
(global-set-key (kbd "M-n") 'maximize-frame)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-;") 'swap-window-positions)
(global-set-key (kbd "C-M-{") 'indent-buffer)
(global-set-key (kbd "M-{") 'indent-region)
