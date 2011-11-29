(setq path "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin")
(setenv "PATH" path)
(push "/usr/local/bin" exec-path)

(setq default-input-method "MacOSX")
(setq ns-command-modifier 'meta)
(setq mac-allow-anti-aliasing t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)

;; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode)
(set-fringe-style 0)
(tooltip-mode -1)
(global-auto-revert-mode 1)

;; Line numbers in column, kinda sucks
;; (fringe-mode 1)
;; (global-linum-mode 1)
;; (setq linum-format " %d ")

;; load themes
(set-frame-font "Menlo-15")
(setq my-theme-dir "~/.emacs.d/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)
(setq custom-safe-themes 
      (quote ("71203f3f2e0648822e3c3afc40ce0c7cea65f474" 
              "0174d99a8f1fdc506fa54403317072982656f127"
              "3df2d93e0c665215da82cb621bdaee03c9882298"
              "a73fd470d417fe2f963e5355e9211fe88acd45f2"
              "0497fe19792c0c40e0d5377b8711aadd3ec9ed11"
              default)))

(load-theme 'burds-of-paradise)
;; (load-theme 'railscasts)
;; (load-theme 'tango-dark)
;; (load-theme 'wombat)

;; load global helpers for some neat functions
(load "helpers/global.el")

(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-o"))
(global-unset-key (kbd "M-s"))
(global-set-key (kbd "M-o") 'find-file)
(global-set-key (kbd "M-w") 'close-current-buffer)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-S-s") 'write-file)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-x") 'kill-region-and-save)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-V") 'yank-pop)
(global-set-key (kbd "M-C") 'copy-all)
(global-set-key (kbd "M-X") 'cut-all)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-Z") 'redo)
(global-set-key (kbd "M-L") 'goto-line)

(global-set-key (kbd "C-x x") 'execute-extended-command)
(global-set-key (kbd "M-p") 'dabbrev-expand)
(define-key lisp-mode-shared-map (kbd "M-r") 'eval-buffer)
(define-key lisp-mode-shared-map (kbd "C-j") 'eval-last-sexp)

;; these functions are found in helpers/global
(global-set-key (kbd "M-N") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-k") 'delete-whole-line)
(global-set-key (kbd "C-M-{") 'indent-buffer)
(global-set-key (kbd "C-;") 'swap-window-positions)

(recentf-mode 1)
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
