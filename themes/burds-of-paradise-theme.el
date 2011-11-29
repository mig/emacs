(deftheme burds-of-paradise
  "Theme for faces, based on the Chocolatapp theme.")

(custom-theme-set-faces
 'burds-of-paradise
 '(default ((t (:foreground "#ebe5cf" :background "#232323"))))
 '(cursor ((t (:foreground "#ebe5cf" :background "#ebe5cf"))))
 '(highlight ((t (:background "#2d2d2d"))))
 '(region ((t (:background "#3a3a3a"))))
 '(font-lock-builtin-face ((t (:foreground "#7EAAC6"))))
 '(font-lock-comment-face ((t (:foreground "#3f3f3f"))))
 '(font-lock-constant-face ((t (:foreground "#7EAAC6"))))
 '(font-lock-function-name-face ((t (:foreground "#F3B748"))))
 '(font-lock-keyword-face ((t (:foreground "#F37244"))))
 '(font-lock-string-face ((t (:foreground "#E0DA79"))))
 '(font-lock-type-face ((t (:foreground "#ebe5cf"))))
 '(font-lock-variable-name-face ((t (:foreground "#8FBBAC"))))
 '(font-lock-warning-face ((t (:foreground "#990000"))))
 '(erb-out-delim-face ((t (:foreground "#ebe5cf"))))
 '(erb-delim-face ((t (:foreground "#ebe5cf" ))))
 '(erb-exec-face ((t (:background "#222222"))))
 '(erb-out-face ((t (:background "#222222"))))

 '(button ((t (:underline t :foreground "#7EAAC6"))))
 '(link ((t (:underline t :foreground "#7EAAC6"))))
 '(link-visited ((t (:underline t :foreground "#7EAAC6"))))
 '(mode-line ((t (:box nil
		       :background "#202020" :foreground "#3a3a3a"))))
 '(mode-line-inactive ((t (:box nil
				:background "#3a3a3a" :foreground "#202020"))))
 '(isearch ((t (:background "#3a3a3a"))))
 '(minibuffer-prompt ((t (:bold t :foreground "#F37244"))))
 '(show-paren-match-face ((t (:foreground "#3f3f3f" :background "#F37244"))))
 '(show-paren-mismatch-face ((t (:foreground "#3f3f3f" :background "#990000"))))
 '(lazy-highlight ((t (:background "#F37244")))))

(provide-theme 'burds-of-paradise)
