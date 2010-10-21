(require 'el-get)
(load "el-get-after-hooks.el")
(setq el-get-sources
      '((:name package)
        (:name rainbow-mode)
				(:name color-theme)
        ;; (:name color-theme-sanityinc
        ;;        :type git
        ;;        :url "git://github.com/purcell/color-theme-sanityinc.git"
        ;;        :load "color-theme-sanityinc.el")
        (:name color-theme-railscasts
               :type git
               :url "git://github.com/mig/color-theme-railscasts.git"
               :load "color-theme-railscasts.el")
        (:name textmate
               :type http
               :url "http://github.com/defunkt/textmate.el/raw/master/textmate.el"
               :load "textmate.el")
        (:name ruby-mode :type elpa)
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name rvm 
               :type git
               :url "git://github.com/djwhitt/rvm.el.git"
               :load "rvm.el")
        (:name rinari
               :type git
               :url "git://github.com/mig/rinari.git"
               :features rinari
               :load-path ("." "util" "util/jump"))
        (:name rhtml
               :type git
               :url "git://github.com/mig/rhtml.git"
               :features rhtml-mode)
        (:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode)
        (:name nav :type elpa)
        (:name css-mode :type elpa)
        ))
(el-get)
