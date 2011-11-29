(defun insert-ruby-hash-pointer ()
  (interactive)
  (insert " => "))

(defun insert-erb-skeleton ()
  (interactive)
  (let (start-point)
    (setq start-point (point))
    (backward-char 3)
    (cond 
     ((search-forward "%= " start-point t)
      (progn 
        (replace-match "% ") 
        (goto-char start-point)
        (backward-char 1))
      ((search-forward "<% " start-point t)
       (progn
         (replace-match "<%= ")
         (goto-char start-point)
         (forward-char 1)))
      (t 
       (progn 
         (goto-char start-point) 
         (insert "<%=  %>") 
         (backward-char 3))))))

;; these functions depend on textmate-mode and ruby-compilation
(defun rails-app-p ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun rails-file-or-directory-p (name)
  (file-exists-p (expand-file-name name (textmate-project-root))))

(defun bundler-p ()
  (rails-file-or-directory-p "Gemfile"))

(defun testunit-p ()
  (rails-file-or-directory-p "test"))

(defun rspec-p ()
  (rails-file-or-directory-p "spec"))

(defun rvm-ruby ()
  (let* ((path (list-to-string rvm--current-ruby-binary-path))
         (ruby (list-to-string (list path "ruby"))))
    ruby))

(defun testunit-run-command ()
  (list (rvm-ruby) "-Itest" (file-relative-name (buffer-file-name) (textmate-project-root))))

(defun rspec-run-command ()
  (list "rspec" (file-relative-name (buffer-file-name) (textmate-project-root))))

(defun suite-run-command ()
  (if (rspec-p)
      (rspec-run-command)
    (testunit-run-command)))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (rails-app-p)
      (let* ((path (buffer-file-name))
            (filename (file-name-nondirectory path))
            (command (suite-run-command)))
        (when (bundler-p) (setq command (append '("bundle" "exec") command)))
        (setq command (append (list "cd" (textmate-project-root) ";") command))
        (message (mapconcat 'identity command " "))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

;; (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer)

(defun run-rails-console ()
  (interactive)
  (run-ruby (expand-file-name "script/console" (textmate-project-root))))

(defun update-test-unit-syntax ()
  (interactive)
  (goto-char (point-min))
  (replace-regexp-and-return "\\def test\\(.*$\\)" "test \"\\1\" do")
  (replace-regexp-and-return "test \"\\(_\w+\\)+" " \1"))
