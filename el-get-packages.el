(defun go-textmate ()
  (textmate-mode t)
  (global-set-key (kbd "M-RET") 'textmate-next-line)
  (global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "M-t") 'textmate-goto-file)
  (global-set-key (kbd "M-T") 'textmate-goto-symbol)
  (global-set-key (kbd "M-]") 'textmate-shift-right)
  (global-set-key (kbd "M-[") 'textmate-shift-left))

(defun go-ruby ()
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
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
       (require 'inf-ruby)
       (require 'ruby-compilation)
			 (load "helpers/rails.el")
       (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer)
       (define-key ruby-mode-map (kbd "C-l") 'insert-ruby-hash-pointer))))

(defun go-rhtml ()
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

(defun go-yaml ()
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun go-css ()
  (add-hook 'css-mode-hook
            '(lambda ()
               (setq css-indent-level 2)
               (setq css-indent-offset 2))))

(require 'el-get)
(setq el-get-sources
      '((:name color-theme)
        (:name color-theme-railscasts
               :type git
               :url "git://github.com/mig/color-theme-railscasts.git"
               :load "color-theme-railscasts.el"
               :after (lambda () (color-theme-railscasts)))
        (:name rainbow-mode)
        (:name ruby-mode 
               :type elpa
               :load "ruby-mode.el"
               :after (lambda () (go-ruby)))
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name css-mode :type elpa :after (lambda () (go-css)))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el"
               :after (lambda () (go-textmate)))
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda () (rvm-use-default)))
        (:name rhtml
               :type git
               :url "git://github.com/mig/rhtml.git"
               :features rhtml-mode
        			 :after (lambda () (go-rhtml)))
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
        	     :after (lambda () (go-yaml)))
))
(el-get 'sync)
