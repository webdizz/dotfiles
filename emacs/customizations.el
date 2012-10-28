;; This file is symlinked to '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist (quote ((menu-bar-lines . 1) (foreground-color . "Black") (background-color . "White") (cursor-type . box) (cursor-color . "Red") (internal-border-width . 0) (left-fringe . 1) (right-fringe) (fringe) (vertical-scroll-bars) (tool-bar-lines . 0))))
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(visual-line-mode nil t))


;;; == Groovy Mode ==
(add-to-list 'load-path "~/.emacs.d/emacs-groovy-mode/")
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(emacs-lisp-mode-default ((t (:inherit autoface-default :height 110 :family "Droid Sans Mono"))) t)
 '(groovy-mode-default ((t (:inherit autoface-default :height 110 :family "Droid Sans Mono"))) t)
 '(java-mode-default ((t (:inherit autoface-default :height 110 :family "Droid Sans Mono"))) t)
 '(ruby-mode-default ((t (:inherit autoface-default :height 110 :family "Droid Sans Mono"))) t)
 '(text-mode-default ((t (:inherit autoface-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 110 :width normal :family "Droid Sans Mono")))))


;;; turn on syntax highlighting
(global-font-lock-mode 1)


(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)