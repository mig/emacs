;; under the water the light distorts so strange

(add-to-list 'load-path "~/.emacs.d")

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(load "config.el")
(load "helpers/global.el")

(defun install-el-get ()
  (interactive)
	(url-retrieve
 		"https://github.com/dimitri/el-get/raw/master/el-get-install.el"
 		(lambda (s)
   		(end-of-buffer)
   	(eval-print-last-sexp))))

(if (not (file-directory-p "~/.emacs.d/el-get"))
	(progn
 	  (goto-char (point-max))
    (insert "\nHey man, you need to run package-refresh-contents and install-el-get, then reload init.el or restart emacs."))
	(load "el-get-packages.el"))
