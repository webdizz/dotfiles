;;; Code:

;;  ruby mode for gemspec, Vagrantfile, buildfile
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("Vagrantfile" . ruby-mode))


;; saveplace remembers your location in a file when saving files
(setq save-place-file (concat user-emacs-directory "saveplace"))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; save recent files
(setq recentf-save-file (concat user-emacs-directory "recentf")
      recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode t)

;;; Mode line defaults
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Resizing windows
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; cycle through buffers
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;;tabs
(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(require 'tabbar-ruler)
(tabbar-ruler-group-by-projectile-project)
(global-set-key (kbd "<s-left>") 'tabbar-backward-tab)
(global-set-key (kbd "<s-right>") 'tabbar-forward-tab)

;; key board / input method settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(provide 'configuration)
;;;
