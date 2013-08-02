;; use the marmalade repository
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; install these packages if they are not there.
(defvar my-packages '(color-theme
                      color-theme-solarized
		      flymake-python-pyflakes
		      pyflakes))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; OSX stuff
(setq mac-option-modifier 'nil)
(setq mac-command-modifier 'meta)
(setq x-select-enable-clipboard t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; (color-theme-solarized-dark)
(require 'color-theme)
(color-theme-deep-blue)
(set-fringe-mode -1)

(transient-mark-mode t)
(delete-selection-mode t)

;; Basic Settings
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(column-number-mode t)
(global-font-lock-mode t)
(setq-default show-trailing-whitespace t)
(electric-pair-mode t)
;;(electric-indent-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward))
;; (setq uniquify-buffer-name-style 'reverse)
;; (setq uniquify-separator "|")

(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(defalias 'qrr 'query-replace-regexp)

(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq cperl-indent-level 4)

(setq auto-save-default t)
(setq backup-by-copying t)

(setq temporary-file-directory "~/.emacs.d/temp/")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix
      (concat temporary-file-directory ".auto-saves-"))

(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(ctrl return)] 'smart-open-line)

(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

(if window-system
    ;; Window system present
    (progn
      ;; Disable suspending with C-z and iconifying with C-x C-z
      (global-unset-key (kbd "C-z"))
      (global-unset-key (kbd "C-x C-z"))))

;; Display full filename in the frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq path-to-ctags "~/mytags")

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key (kbd "M-;") 'beginning-of-buffer)
(global-set-key (kbd "M-:") 'end-of-buffer)

(show-paren-mode t)
;; (setq vc-follow-symlinks t)

(require 'multi-term)
(setq multi-term-program "/bin/bash")
