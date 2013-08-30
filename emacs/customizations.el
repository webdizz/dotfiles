;; This file is symlinked to '~/Library/Preferences/Aquamacs\ Emacs/customizations.el'

;; Org-mode
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/lisp")
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/contrib/lisp")
;(add-to-list 'load-path "~/dev/tools/emacs/org-mode/contrib/babel/langs")
;(autoload 'org-mode "org-mode" "Org editing mode." t)

;; This are setting for nice tabbar items
;; to have an idea of what it looks like http://imgur.com/b0SNN
;; inspired by Amit Patel screenshot http://www.emacswiki.org/pics/static/NyanModeWithCustomBackground.png


;; enable saving opened files on exit
(require 'desktop)
(setq history-length 250)
(setq desktop-load-locked-desktop t)
(add-to-list 'desktop-globals-to-save 'file-name-history)
;; (add-to-list 'desktop-modes-not-to-save 'dired-mode)
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
;; Automatically save and restore sessions
;; (setq desktop-dirname             "~/.emacs.d/desktop/")
      ;; desktop-base-file-name      "emacs.desktop"
      ;; desktop-base-lock-name      "lock"
      ;; desktop-path                (list desktop-dirname)
      ;; desktop-save                t
      ;; desktop-files-not-to-save   "^$" ;reload tramp paths
      ;; desktop-load-locked-desktop nil)
(desktop-save-mode 1)

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)

(require 'ac-helm) ;; Not necessary if using ELPA package
(define-key ac-complete-mode-map (kbd "M-/") 'ac-complete-with-helm)

;; Tabbar
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "white"
 :foreground "black"
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(tabbar-mode 1)



;; Inspired by https://bitbucket.org/thegeekinside/dotfiles/src/f500770dcaca65617ddd62ed53d2974924c7df19/emacs/emacs?at=default

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist (quote ((menu-bar-lines . 1) (foreground-color . "Black") (background-color . "White") (cursor-type . box) (cursor-color . "Red") (internal-border-width . 0) (left-fringe . 1) (right-fringe) (fringe) (tool-bar-lines . 0))))
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
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


;;  ruby mode for gemspec, Vagrantfile, buildfile
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("Vagrantfile" . ruby-mode))

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
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
    '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
    '("tromey" . "http://tromey.com/elpa/") t)
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

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
 (set-frame-parameter (selected-frame) 'alpha '(97 95))
 (add-to-list 'default-frame-alist '(alpha 97 95))

;; enable YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; enable JSON mode
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; enable JS2 mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;;; Dired mode
;; do not open new buffer on entering directory
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "<return>")
    'dired-find-alternate-file) ; was dired-advertised-find-file
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))
;; How to copy from one dired dir to the next dired dir shown in a split window?
(setq dired-dwim-target t)
;; allow dired to be able to delete or copy a whole dir.
;; “always” means no asking. “top” means ask once. Any other symbol means ask each and every time for a dir and subdir.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))
(require 'dired-x)

;; move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(global-set-key [(A-M-up)] 'move-line-up)

;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key [(A-M-down)] 'move-line-down)

;; ido-mode
(require 'ido)
    (ido-mode t)

;; set line ending
(set-buffer-file-coding-system 'unix)

;; turn on spell check
(defun turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'turn-spell-checking-on)

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 

;; Solarized Colorscheme 
(require 'color-theme) 
(color-theme-initialize) 
(setq color-theme-is-global t) (color-theme-solarized-light) 

Activate pointback
(require 'pointback)
  (pointback-mode t)

(require 'restclient)

(require 'uniquify)

;; projectile
(require 'projectile)
;; You can enable projectile globally like this:
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths)

