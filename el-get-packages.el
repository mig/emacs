(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(load "el-get-package-hooks.el")

(setq el-get-sources
      '(el-get rainbow-mode markdown-mode
        (:name ruby-mode 
               :type elpa
               :after (lambda () (ruby-mode-hook)))
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name css-mode 
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
        (:name emacs-xcode
               :type git
               :url "git://github.com/senny/emacs-xcode.git"
               :features xcode)
        (:name full-ack :type elpa)
	))
(el-get 'sync)
