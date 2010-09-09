(require 'el-get)
(setq el-get-sources
      '((:name color-theme)
        (:name color-theme-twilight)
        (:name textmate
               :type http
               :url "http://github.com/defunkt/textmate.el/raw/master/textmate.el"
               :load "textmate.el"
               :after (lambda ()
                        (textmate-mode t)
                        (global-set-key (kbd "M-RET") 'textmate-next-line)
                        (global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
                        (global-set-key (kbd "M-t") 'textmate-goto-file)
                        (global-set-key (kbd "M-T") 'textmate-goto-symbol)
                        (global-set-key (kbd "M-]") 'textmate-shift-right)
                        (global-set-key (kbd "M-[") 'textmate-shift-left)))
        (:name ruby-mode 
               :type elpa
               :after (lambda ()
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
                             (define-key ruby-mode-map (kbd "C-l") 'insert-ruby-hash-pointer)))))
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name rvm 
               :type elpa
               :after (lambda () (rvm-use-default)))
        (:name jump
               :type git
               :url "git://github.com/eschulte/jump.el.git")
        (:name rinari
               :type git
               :url "git://github.com/eschulte/rinari.git"
               :features rinari
               :after (lambda ()
                        (setq rinari-tags-file-name "TAGS")
                        (add-hook 'rinari-minor-mode-hook
                                  (lambda ()
                                    (define-key rinari-minor-mode-map (kbd "M-r") 'rinari-test)))))
        (:name rhtml
               :type git
               :url "git://github.com/eschulte/rhtml.git"
               :features rhtml-mode
               :after (lambda ()
                        (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
                        (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
                        (eval-after-load 'rhtml-mode
                          '(progn
                             (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)
                             (define-key rhtml-mode-map (kbd "C-l") 'insert-ruby-hash-pointer)
                             (define-key rhtml-mode-map (kbd "C->") 'insert-erb-skeleton)
                             (define-key rhtml-mode-map (kbd "C-M->") (lambda ()
                                                                        (interactive)
                                                                        (insert-erb-skeleton 0)))))))
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda ()
                        (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
                        (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))))
        (:name nav 
               :type elpa 
               :after (lambda() (global-set-key (kbd "M-\\") 'nav)))
        (:name css-mode 
               :type elpa
               :after (lambda()
                        (add-hook 'css-mode-hook
                                  '(lambda ()
                                     (setq css-indent-offset 2)
                                     (add-hook 'before-save-hook 'untabify-buffer)))))
        ))
(el-get)
