(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-o"))
(global-unset-key (kbd "M-s"))
(global-set-key (kbd "M-o") 'find-file) ; Open
(global-set-key (kbd "M-w") 'close-current-buffer) ; Close
(global-set-key (kbd "M-s") 'save-buffer) ; Save
(global-set-key (kbd "M-S-s") 'write-file) ; Save As.
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; Select All
(global-set-key (kbd "M-x") 'kill-region) ; Cut
(global-set-key (kbd "M-c") 'kill-ring-save) ; Copy
(global-set-key (kbd "M-v") 'yank) ;  Paste
(global-set-key (kbd "M-V") 'yank-pop)
(global-set-key (kbd "M-C") 'copy-all)
(global-set-key (kbd "M-X") 'cut-all)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-Z") 'redo)
;; i do these so i can use M-x as cut
(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "M-X") 'execute-extended-command)

(setq default-input-method "MacOSX")
(setq ns-command-modifier 'meta)
(setq mac-option-modifier 'super)

(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(add-hook 'text-mode-hook (lambda () (hl-line-mode 1)))
(line-number-mode 1)
(column-number-mode 1)
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(recentf-mode 1)
(global-visual-line-mode 0)
(global-auto-revert-mode 1)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq show-trailing-whitespace t)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-face-attribute 'mode-line nil :box nil)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(set-default-font "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")

(setq path "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin")
(setenv "PATH" path)

(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-max-prospects 10)
(add-to-list 'ido-ignore-files "\\.DS_Store")

(define-key lisp-mode-shared-map (kbd "M-R") 'eval-last-sexp)
(define-key lisp-mode-shared-map (kbd "M-r") 'eval-buffer)

;; javascript indent
(setq js-indent-level 2)