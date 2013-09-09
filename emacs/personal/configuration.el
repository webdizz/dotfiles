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


(provide 'configuration)
;;;
