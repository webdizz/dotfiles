;;  ruby mode for gemspec, Vagrantfile, buildfile
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("Vagrantfile" . ruby-mode))
