;;; Code:

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

;;  ruby mode for gemspec, Vagrantfile, buildfile
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("Vagrantfile" . ruby-mode))

(require 'helm-config)
(helm-mode)

;; saveplace remembers your location in a file when saving files
(setq save-place-file (concat user-emacs-directory "saveplace"))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; save recent files
(setq recentf-save-file (concat user-emacs-directory "recentf")
      recentf-max-saved-items 200
      recentf-max-menu-items 200)
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


;;(require 'zlc)
;;(zlc-mode t)

;; Plantuml
(autoload 'plantuml-mode "plantuml-mode" "Plantuml editing mode." t)
(add-to-list 'auto-mode-alist '("\.pml$" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\.pml$" . plantuml-mode))


(require 'iimage)
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(add-to-list 'iimage-mode-image-regex-alist '("@startuml\s+\\(.+\\)" . 1))

;; Rendering plantuml
(defun plantuml-render-buffer ()
  (interactive)
  (message "PLANTUML Start rendering")
  (shell-command (concat "java -jar ~/dev/tools/plantuml.jar "
                         buffer-file-name))
  (message (concat "PLANTUML Rendered:  " (buffer-name))))

;; Image reloading
(defun reload-image-at-point ()
  (interactive)
  (message "reloading image at point in the current buffer...")
  (image-refresh (get-text-property (point) 'display)))

;; Image resizing and reloading
(defun resize-image-at-point ()
  (interactive)
  (message "resizing image at point in the current buffer123...")
  (let* ((image-spec (get-text-property (point) 'display))
         (file (cadr (member :file image-spec))))
    (message (concat "resizing image..." file))
    (shell-command (format "convert -resize %d %s %s "
                           (* (window-width (selected-window)) (frame-char-width))
                           file file))
    (reload-image-at-point)))


(global-set-key (kbd "C-x C-]") 'plantuml-render-buffer)

(defvar plantuml-jar-path (expand-file-name "~/dev/tools/plantuml.jar"))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/dev/tools/plantuml.jar"))

(require 'egg)

;; code templates
; should be loaded before auto complete so that they can work together
(require 'yasnippet-bundle)

(require  'helm-config)
(require 'ac-helm)
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
; helm completion
(helm-mode 1)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(setq
 auto-complete-mode t
 global-auto-complete-mode t
 ac-delay 0.5
 ;ac-auto-show-menu 0.1
 ac-quick-help-delay 0.5
 ac-auto-start 3
 ac-override-local-map nil
 ac-use-menu-map t
 ac-set-trigger-key "TAB"
 ac-ignore-case t
 ac-ignore-case 'smart
 ac-ignore-case nil
 ac-source-words-in-all-buffer t
)

(add-to-list 'ac-modes 'sql-mode)
(add-to-list 'ac-modes 'puppet-mode)
(add-to-list 'ac-modes 'erlang-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'groovy-mode)

(define-key ac-completing-map "\ESC/" 'ac-stop)
(define-key ac-menu-map "C-n" 'ac-next)
(define-key ac-menu-map "C-p" 'ac-previous)

;; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

;; aka vi(m) dot mode
(require 'dot-mode)
;(add-hook 'find-file-hooks 'dot-mode-on)

(provide 'configuration)
