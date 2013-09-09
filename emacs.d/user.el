;; -*- lexical-binding: t -*-
;; My customizations

;; OSX stuff
(setq mac-option-modifier 'nil)
(setq mac-command-modifier 'meta)
(setq x-select-enable-clipboard t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(transient-mark-mode 1) ;; highlights selection
(delete-selection-mode 1) ;; replaces selection with inserted data

(column-number-mode 1)
(global-font-lock-mode 1)

(show-paren-mode 1)
(electric-pair-mode 1)

(setq-default show-trailing-whitespace t) ;; show-trailing is set per buffer

(setq indent-tabs-mode nil)
(setq tab-width 4)

(setq require-final-newline t)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'y-or-n-p)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace) ;; open file where we left off
(setq-default save-place t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-p") 'switch-to-buffer)

(setq save-place-file (concat user-emacs-directory "places"))
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

(require 'color-theme)
(color-theme-monokai)

(setq tab-always-indent 'complete)

(setq-default command-frequency-table-file (concat user-emacs-directory "frequencies"))
(require 'command-frequency)
(command-frequency-table-load)
(command-frequency-mode 1)
(command-frequency-autosave-mode 1)

(defun krl-puppet-mode ()
  (whitespace-mode t))

(add-hook 'puppet-mode-hook 'krl-puppet-mode)

(defun krl-python-mode ()
  (setq-local tab-always-indent t))

(add-hook 'python-mode-hook 'krl-python-mode)

(require 'evil)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ";") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)

(define-key evil-normal-state-map " 1" 'delete-other-windows)
(define-key evil-normal-state-map " 2" 'split-window-below)
(define-key evil-normal-state-map " 3" 'split-window-right)
(define-key evil-normal-state-map " 0" 'delete-window)

(define-key evil-normal-state-map " o" 'other-window)
(define-key evil-normal-state-map " k" 'kill-buffer)
(define-key evil-normal-state-map " p" 'switch-to-buffer)

(evil-mode 1)
