(defun color-theme-merbivore-after-hook () (color-theme-merbivore))
(defun color-theme-railscasts-after-hook () (color-theme-railscasts))

(defun textmate-after-hook ()
  (textmate-mode t)
  (global-set-key (kbd "M-RET") 'textmate-next-line)
  (global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "M-t") 'textmate-goto-file)
  (global-set-key (kbd "M-T") 'textmate-goto-symbol)
  (global-set-key (kbd "M-]") 'textmate-shift-right)
  (global-set-key (kbd "M-[") 'textmate-shift-left))

(defun ruby-mode-after-hook ()
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (setq ruby-mode-hook
        (lambda ()
          (setq ruby-deep-arglist t)
          (setq ruby-deep-indent-paren nil)
          (setq c-tab-always-indent nil)))
  (eval-after-load 'ruby-mode
    '(progn
       (define-key ruby-mode-map (kbd "M-r") 'ruby-compilation-this-buffer)
       (define-key ruby-mode-map (kbd "C-l") 'insert-ruby-hash-pointer))))

(defun rvm-after-hook () (rvm-use-default))

(defun rinari-after-hook ()
  (setq rinari-tags-file-name "TAGS")
  (add-hook 'rinari-minor-mode-hook
            (lambda ()
              (define-key rinari-minor-mode-map (kbd "M-r") 'rinari-test))))

(defun rhtml-after-hook ()
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (eval-after-load 'rhtml-mode
    '(progn
       (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)
       (define-key rhtml-mode-map (kbd "C-l") 'insert-ruby-hash-pointer)
       (define-key rhtml-mode-map (kbd "C->") 'insert-erb-skeleton)
       (define-key rhtml-mode-map (kbd "C-M->") (lambda ()
                                                  (interactive)
                                                  (insert-erb-skeleton 0))))))

(defun yaml-mode-after-hook ()
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun nav-after-hook () (global-set-key (kbd "M-\\") 'nav))

(defun css-mode-after-hook ()
  (add-hook 'css-mode-hook
            '(lambda ()
               (setq css-indent-level 2)
               (setq css-indent-offset 2))))
