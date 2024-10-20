(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package no-littering
  :config
  (no-littering-theme-backups))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(use-package emacs
  :custom
  (menu-bar-mode nil)         
  (scroll-bar-mode nil)       
  (tool-bar-mode nil)         
  (inhibit-startup-screen t)  
  (delete-selection-mode t)   
  (electric-indent-mode nil)  
  (electric-pair-mode t)      
  (display-battery-mode t)
  (ring-bell-function 'ignore)
  (blink-cursor-mode nil)     
  (global-auto-revert-mode t) 
  (dired-kill-when-opening-new-dired-buffer t)
  (truncate-lines t)
  (gnus-agent nil)
  (display-line-numbers-type 'relative) 
  (global-display-line-numbers-mode t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (mouse-wheel-progressive-speed nil) 
  (scroll-conservatively 10)
  (scroll-margin 10)
  (split-height-threshold nil)
  (split-width-threshold 0)
  (tab-width 4)
  (make-backup-files nil)
  (auto-save-default nil)
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(custom-set-variables
  '(auto-save-visited-mode t))
;; This is a test
(setq auto-save-visited-interval 2)

(use-package minions
  :config (minions-mode 1))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-org-config))

(set-face-attribute 'default nil
                    :height 120
                    :weight 'medium)
(setq-default line-spacing 0.15)

(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(use-package dashboard
  :custom
  (dashboard-banner-logo-title "With Great Power Comes Great Responsibility!")
  (dashboard-center-content t)
  (dashboard-items '((projects . 5)))
  (dashboard-set-file-icons t)
  (dashboard-set-footer nil)
  (dashboard-projects-backend 'projectile)
  (dashboard-set-heading-icons t)
  (dashboard-set-navigator t)
  (dashboard-show-shortcuts nil)
  (dashboard-startupify-list '(dashboard-insert-banner
                               dashboard-insert-newline
                               dashboard-insert-banner-title
                               dashboard-insert-items
                               dashboard-insert-newline
                               dashboard-insert-init-info))
  (dashboard-startup-banner 'logo)
  :config (dashboard-setup-startup-hook))

;;; Completions
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package corfu
  :after orderless
  :custom
  (corfu-cycle nil)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-mode t)
  (corfu-popupinfo-delay 0.15)
  (corfu-separator ?\s)
  (corfu-count 14)
  (corfu-scroll-margin 4)
  (completion-ignore-case t)
  (tab-always-indent 'complete)
  (corfu-preview-current nil)
  (completion-styles '(orderless basic))
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default)
  (kind-icon-blend-background nil)
  (kind-icon-blend-frac 0.08)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

(use-package vertico
  :bind (:map vertico-map
              ("<tab>" . vertico-insert)
              ("C-k" . vertico-next)
              ("C-j" . vertico-exit)
              ("C-i" . vertico-previous))
  :custom
  (vertico-cycle t)
  (vertico-count 13)
  (vertico-resize t)
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  (marginalia-mode-hook . nerd-icons-completion-marginalia-setup))

(use-package embark
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
         ("C-c C-c" . embark-collect)
         ("C-c C-e" . embark-export)))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package org
  :custom
  (org-edit-src-content-indentation 4) ;; Set src block automatic indent to 4 instead of 2.
  (org-startup-indented t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(450))
  (org-fold-catch-invisible-edits 'error)
  (org-pretty-entities t)
  (org-id-link-to-org-use-id t)
  (org-fold-catch-invisible-edits 'show)

  :hook
  (org-mode . org-indent-mode))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.0))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.0)))))

(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-startup-folded 'fold)

(use-package toc-org
  :after org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(defun start/org-mode-visual-fill ()
  (setq visual-fill-column-width 200
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :after  org
  :hook (org-mode . start/org-mode-visual-fill))

(use-package org-modern
  :after  org
  :hook (org-mode . org-modern-mode))

(use-package flycheck)

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package tree-sitter
  :straight t
  :config(global-tree-sitter-mode
          (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
		(cmake "https://github.com/uyha/tree-sitter-cmake")
		(css "https://github.com/tree-sitter/tree-sitter-css")
		(elisp "https://github.com/Wilfred/tree-sitter-elisp")
		(html "https://github.com/tree-sitter/tree-sitter-html")
		(zig "https://github.com/GrayJack/tree-sitter-zig")
		(go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (gdscript "https://github.com/PrestonKnopp/tree-sitter-gdscript")
		(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
		(json "https://github.com/tree-sitter/tree-sitter-json")
		(ruby "https://github.com/tree-sitter/tree-sitter-ruby")
		(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
		(make "https://github.com/alemuller/tree-sitter-make")
		(rust "https://github.com/tree-sitter/tree-sitter-rust")
		(python "https://github.com/tree-sitter/tree-sitter-python")
		(toml "https://github.com/tree-sitter/tree-sitter-toml")
		(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
		(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
		(yaml "https://github.com/ikatyang/tree-sitter-yaml")))
;; Install all langs
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(setq treesit-font-lock-level 4)

(use-package treesit-auto
  :straight t
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package dape
  :config 
  (setq dape-cwd-fn 'projectile-project-root)
  (setq dape-buffer-window-arrangement 'right))

(use-package eglot
      :straight nil ;; Don't install eglot because it's now built-in
      :config
      (add-hook 'go-ts-mode-hook 'eglot-ensure)
      (add-hook 'ruby-ts-mode-hook 'eglot-ensure)
      (add-hook 'python-ts-mode-hook 'eglot-ensure)
      (add-hook 'rust-ts-mode-hook 'eglot-ensure)
      :custom
      (eglot-autoshutdown t)
      (fset #'jsonrpc--log-event #'ignore)
      (eglot-events-buffer-size 0) ;; No event buffers (Lsp server logs)
(setq eglot-ignored-server-capabilities '(:documentHighlightProvider :inlayHintProvider))
      (eglot-report-progress nil)
      (eglot-events-buffer-size 0)
      (eglot-sync-connect nil)
      (eglot-extend-to-xref nil))

    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(gdscript-mode . ("localhost:6005"))))

    ;;; Mason from neovim is just a great way to manage lsps
    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(bash-ts-mode . ("~/.local/share/nvim/mason/bin/bash-language-server"))))

    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(rust-ts-mode . ("~/.local/share/nvim/mason/bin/rust-analyzer"))))

    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(go-ts-mode . ("~/.local/share/nvim/mason/bin/gopls"))))

    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(ruby-ts-mode . ("~/.local/share/nvim/mason/bin/ruby-lsp"))))

    (with-eval-after-load 'eglot
      (add-to-list 'eglot-server-programs
                   '(python-ts-mode . ("~/.local/share/nvim/mason/bin/pyright-langserver" "--stdio"))))

(use-package eat
  :hook ('eshell-load-hook #'eat-eshell-mode))

(use-package docker
  :straight t
  :bind ("C-c d" . docker))

(use-package projectile
  :init
  (projectile-mode)
  :custom
  (projectile-run-use-comint-mode t) ;; Interactive run dialog when running projects inside emacs (like giving input)
  (projectile-switch-project-action #'projectile-dired) ;; Open dired when switching to a project
  (projectile-project-search-path '("~/projects/" "~/work/" ("~/code" . 2)))) ;; . 1 means only search the first subdirectory level for projects
(setq persp-suppress-no-prefix-key-warning 't)

(use-package perspective
  :init
  (persp-mode))

;;; Each Project has its own perspective
(use-package persp-projectile)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package harpoon)

(use-package magit
  :commands magit-status)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-gutter
  :config(global-git-gutter-mode +1))

(use-package undo-tree
  :config (global-undo-tree-mode))

(use-package helpful)

(use-package system-packages)

(use-package devdocs)

(use-package consult
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
  )

(use-package crux)

(use-package meow)

(defun meow-setup ()
  (setq meow-cheatsheet-physical-layout meow-cheatsheet-physical-layout-iso)
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwertz)

  (meow-thing-register 'angle
                       '(pair (";") (":"))
                       '(pair (";") (":")))

  (setq meow-char-thing-table
        '((?( . round)
			(?[ . square)
			  (?{ . curly)
			  (?< . angle)
			  (?s . string)
			  (?p . paragraph)
			  (?l . line)
			  (?b . buffer)))

		  (meow-leader-define-key
		   ;; Use SPC (0-9) for digit arguments.
		   '("1" . meow-digit-argument)
		   '("2" . meow-digit-argument)
		   '("3" . meow-digit-argument)
		   '("4" . meow-digit-argument)
		   '("5" . meow-digit-argument)
		   '("6" . meow-digit-argument)
		   '("7" . meow-digit-argument)
		   '("8" . meow-digit-argument)
		   '("9" . meow-digit-argument)
		   '("0" . meow-digit-argument)
		   '("-" . meow-keypad-describe-key)
		   '("_" . meow-cheatsheet))

		  (meow-normal-define-key
		   ;; expansion
		   '("0" . meow-expand-0)
		   '("1" . meow-expand-1)
		   '("2" . meow-expand-2)
		   '("3" . meow-expand-3)
		   '("4" . meow-expand-4)
		   '("5" . meow-expand-5)
		   '("6" . meow-expand-6)
		   '("7" . meow-expand-7)
		   '("8" . meow-expand-8)
		   '("9" . meow-expand-9)
		   '("ä" . meow-reverse)

		   ;; movement
		   '("i" . meow-prev)
		   '("k" . meow-next)
		   '("j" . meow-left)
		   '("l" . meow-right)

		   '("z" . meow-search)
		   '("-" . meow-visit)

		   ;; expansion
		   '("I" . meow-prev-expand)
		   '("K" . meow-next-expand)
		   '("J" . meow-left-expand)
		   '("L" . meow-right-expand)
		   
		   '("u" . meow-back-word)
		   '("U" . meow-back-symbol)
		   '("o" . meow-next-word)
		   '("O" . meow-next-symbol)
		   '("a" . meow-mark-word)
		   '("A" . meow-mark-symbol)
		   '("s" . meow-line)
		   '("S" . meow-goto-line)
		   '("w" . meow-block)
		   '("q" . meow-join)
		   '("g" . meow-grab)
		   '("G" . meow-pop-grab)
		   '("m" . meow-swap-grab)
		   '("M" . meow-sync-grab)
		   '("p" . meow-cancel-selection)
		   '("P" . meow-pop-selection)

		   '("x" . meow-till)
		   '("y" . meow-find)

		   '("," . meow-beginning-of-thing)
		   '("." . meow-end-of-thing)
		   '(";" . meow-inner-of-thing)
		   '(":" . meow-bounds-of-thing)

		   ;; editing
		   '("d" . meow-kill)
		   '("f" . meow-change)
		   '("t" . meow-delete)
		   '("c" . meow-save)
		   '("v" . meow-yank)
		   '("V" . meow-yank-pop)

		   '("e" . meow-insert)
		   '("E" . meow-open-above)
		   '("r" . meow-append)
		   '("R" . meow-open-below)

		   '("h" . undo-tree-undo)
		   '("H" . undo-tree-redo)

		   '("b" . open-line)
		   '("B" . split-line)

		   '("ü" . indent-rigidly-left-to-tab-stop)
		   '("+" . indent-rigidly-right-to-tab-stop)

		   ;; ignore escape
		   '("<escape>" . ignore)))

		(meow-setup)
		(setq meow-keypad-leader-dispatch "C-c")
		(meow-global-mode 1)

(use-package meow-tree-sitter
  :after (meow treesitter))
(meow-tree-sitter-register-defaults)

(defun marker-is-point-p (marker)
  "test if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe () 
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))


(defun backward-global-mark () 
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(global-set-key (kbd "M-j") 'backward-global-mark)
(global-set-key (kbd "M-l") 'forward-global-mark)

(defun my/find-buffer ()
  "Use `consult-project-buffer` if in a project, otherwise `consult-buffer`."
  (interactive)
  (if (projectile-project-p)
      (consult-project-buffer)
    (consult-buffer)))

(global-set-key (kbd "C-c b C") 'clean-buffer-list)
(global-set-key (kbd "C-c b k") 'kill-current-buffer)
(global-set-key (kbd "C-c b K") 'kill-some-buffers)
(global-set-key (kbd "C-c b O") 'crux-kill-other-buffers)
(global-set-key (kbd "C-c b r") 'revert-buffer)
(global-set-key (kbd "C-c b b") 'my/find-buffer)
(global-set-key (kbd "C-c b i") 'ibuffer)

(global-set-key (kbd "C-c w j") 'windmove-left)
(global-set-key (kbd "C-c w l") 'windmove-right)
(global-set-key (kbd "C-c w i") 'windmove-up)
(global-set-key (kbd "C-c w k") 'windmove-down)

(global-set-key (kbd "C-c w v") 'split-window-right)
(global-set-key (kbd "C-c w s") 'split-window-below)

(global-set-key (kbd "C-c w d") 'delete-window)
(global-set-key (kbd "C-c w o") 'delete-other-windows)

(global-set-key (kbd "C-c G G") 'magit-status)
(global-set-key (kbd "C-c G s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-c G i") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c G k") 'git-gutter:next-hunk)

(global-set-key (kbd "C-c t p") 'eat-project)
(global-set-key (kbd "C-c t P") 'eat-project-other-window)
(global-set-key (kbd "C-c t t") 'eat)
(global-set-key (kbd "C-c t T") 'eat-other-window)

(global-set-key (kbd "C-c l d") 'eglot-find-declaration)
(global-set-key (kbd "C-c l i") 'eglot-find-implementation)
(global-set-key (kbd "C-c l t") 'eglot-find-typeDefinition)
(global-set-key (kbd "C-c l a") 'eglot-code-actions)
(global-set-key (kbd "C-c l I") 'eglot-code-action-organize-imports)
(global-set-key (kbd "C-c l f") 'eglot-format-buffer)
(global-set-key (kbd "C-c l r") 'eglot-rename)

(global-set-key (kbd "C-c e i") 'flycheck-previous-error)
(global-set-key (kbd "C-c e k") 'flycheck-next-error)
(global-set-key (kbd "C-c e l") 'flycheck-list-errors)
(global-set-key (kbd "C-c e e") 'flycheck-explain-error-at-point)
(global-set-key (kbd "C-c e d") 'flycheck-display-error-at-point)

(defun compile-or-open ()
  "Open the existing compilation buffer in a split window, or run compile if it doesn't exist."
  (interactive)
  (let ((compilation-buffer (get-buffer "*compilation*")))
    (if compilation-buffer
        (progn
          (unless (get-buffer-window compilation-buffer)
            (save-selected-window
              (select-window (split-window-below -15))
              (switch-to-buffer compilation-buffer)
              (shrink-window-if-larger-than-buffer))))
      (call-interactively 'compile))))

(global-set-key (kbd "C-c C o") 'compile-or-open)
(global-set-key (kbd "C-c C c") 'projectile-compile-project)
(global-set-key (kbd "C-c C r") 'recompile)
(global-set-key (kbd "C-c C k") 'kill-compilation)

(global-set-key (kbd "C-c C e i") 'compilation-next-error)
(global-set-key (kbd "C-c C e k") 'compilation-previous-error)
(global-set-key (kbd "C-c C e l") 'consult-compile-error)

(defun my/find-file ()
  "Use `projectile-find-file` if in a project, otherwise `find-file`."
  (interactive)
  (if (projectile-project-p)
      (projectile-find-file)
    (find-file)))


(global-set-key (kbd "C-c f f") 'my/find-file)
(global-set-key (kbd "C-c f F") 'find-file)
(global-set-key (kbd "C-c f g") 'consult-ripgrep)
(global-set-key (kbd "C-c f o") 'consult-outline)

(global-set-key (kbd "C-c 1") 'harpoon-go-to-1)
(global-set-key (kbd "C-c 2") 'harpoon-go-to-2)
(global-set-key (kbd "C-c 3") 'harpoon-go-to-3)
(global-set-key (kbd "C-c 4") 'harpoon-go-to-4)
(global-set-key (kbd "C-c 5") 'harpoon-go-to-5)

(global-set-key (kbd "C-c H a") 'harpoon-add-file)
(global-set-key (kbd "C-c H l") 'harpoon-toggle-quick-menu)
(global-set-key (kbd "C-c H f") 'harpoon-toggle-file)
(global-set-key (kbd "C-c H H") 'harpoon-quick-menu-hydra)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c P") 'perspective-map)
