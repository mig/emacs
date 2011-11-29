(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(load "el-get-package-hooks.el")

(setq el-get-sources
  '((:name css-mode 
           :type elpa 
           :after (lambda () (css-mode-hook)))
    (:name textmate
           :type git
           :url "git://github.com/defunkt/textmate.el"
           :load "textmate.el"
           :after (lambda () (textmate-mode-hook)))
    (:name rvm
           :type git
           :url "git://github.com/djwhitt/rvm.el.git"
           :load "rvm.el"
           :compile ("rvm.el")
           :after (lambda () (rvm-autodetect-ruby)))
    (:name rinari
           :after (lambda () (rinari-mode-hook)))
    (:name rhtml
           :type git
           :url "git://github.com/crazycode/rhtml.git"
           :load-path (".")
           :features rhtml-mode
           :after (lambda () (rhtml-mode-hook)))
    (:name yaml-mode 
           :type git
           :url "git://github.com/yoshiki/yaml-mode.git"
           :features yaml-mode
           :after (lambda () (yaml-mode-hook)))
    (:name xcode
           :type git
           :url "git@github.com:mig/xcode.el.git"
           :load "xcode.el")
    (:name nterm
           :after (lambda () (nterm-hook)))
    (:name full-ack :type elpa)
    (:name rainbow-mode :type elpa)))
	
(setq my-packages
      (append
       '(package24 markdown-mode scratch)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
