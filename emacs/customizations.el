;; This file is symlinked to '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'

;; Org-mode
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/lisp")
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/contrib/lisp")
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/contrib/babel/langs")
;(autoload 'org-mode "org-mode" "Org editing mode." t)


;; Inspired by https://bitbucket.org/thegeekinside/dotfiles/src/f500770dcaca65617ddd62ed53d2974924c7df19/emacs/emacs?at=default

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist (quote ((menu-bar-lines . 1) (foreground-color . "Black") (background-color . "White") (cursor-type . box) (cursor-color . "Red") (internal-border-width . 0) (left-fringe . 1) (right-fringe) (fringe) (vertical-scroll-bars) (tool-bar-lines . 0))))
 '(display-time-mode t)
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


;; Marmalade
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Scala mode
(require 'scala-mode-auto)


;; Plantuml
(add-to-list 'load-path "~/dev/tools/emacs/")
(autoload 'plantuml-mode "plantuml-mode" "Plantuml editing mode." t)
(add-to-list 'auto-mode-alist '("\.pml$" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\.pml$" . plantuml-mode))
(global-set-key (kbd "C-x C-]") 'plantuml-render-buffer)

(defvar plantuml-jar-path (expand-file-name "~/dev/tools/plantuml.jar"))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/dev/tools/plantuml.jar"))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 55)

;; enable saving opened files on exit
(desktop-save-mode 1)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
 (set-frame-parameter (selected-frame) 'alpha '(97 70))
 (add-to-list 'default-frame-alist '(alpha 97 70))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))