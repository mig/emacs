(defun insert-ruby-hash-pointer ()
  (interactive)
  (insert " => "))

(defun insert-erb-skeleton (no-equals)
  "Insert an erb skeleton at point, with optional prefix argument
don't include an '='."
  (interactive "P")
  (insert "<%") (if no-equals (insert "  ") (insert "=  ")) (insert "%>")
  (backward-char 3))

;; this function depends on textmate-mode and ruby-compilation
(defun run-rails-test ()
  (interactive)
  (when (textmate-project-root)
    (let* ((path (buffer-file-name))
           (filename (file-name-nondirectory path))
           (test-path (expand-file-name "test" (textmate-project-root)))
           (command (list ruby-compilation-executable "-I" test-path path)))
      (pop-to-buffer (ruby-compilation-do filename command)))))
