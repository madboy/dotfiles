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
(electric-indent-mode t)

(setq-default command-frequency-table-file (concat user-emacs-directory "frequencies"))
(require 'command-frequency)
(command-frequency-table-load)
(command-frequency-mode 1)
(command-frequency-autosave-mode 1)

(defun krl-puppet-mode ()
  (whitespace-mode t))

(add-hook 'puppet-mode-hook 'krl-puppet-mode)

(defun krl-python-mode ()
  (electric-indent-mode nil)
  (setq tab-always-indent t))

(add-hook 'python-mode-hook 'krl-python-mode)

(defun krl-evil-mode ()
  (local-set-key (kbd "M-p") 'switch-to-buffer)
  (local-set-key (kbd "M-o") 'other-window)
  (local-set-key (kbd "M-x") 'execute-extended-command)
  )

(add-hook 'evil-mode-hook 'krl-evil-mode)