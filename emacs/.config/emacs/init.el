;; Kickstart.emacs is *not* a distribution.
;; It's a template for your own configuration.

;; It is *recommeded* to configure it from the *config.org* file.
;; The goal is that you read every line, top-to-bottom, understand
;; what your configuration is doing, and modify it to suit your needs.

;; You can delete this when you're done. It's your config now. :)

;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun start/org-babel-tangle-config ()
  "Automatically tangle our Emacs.org config file when we save it. Credit to Emacs From Scratch for this one!"
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'start/org-babel-tangle-config)))

(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(use-package emacs
  :custom
  (menu-bar-mode nil)         ;; Disable the menu bar
  (scroll-bar-mode nil)       ;; Disable the scroll bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  (inhibit-startup-screen t)  ;; Disable welcome screen

  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing

  (ring-bell-function 'ignore)
  (blink-cursor-mode nil)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  (dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  (truncate-lines t)
  (display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers

  (dolist (mode '(org-mode-hook
                  term-mode-hook
                  shell-mode-hook
                  treemacs-mode-hook
                  eshell-mode-hook))

    (add-hook mode (lambda () (display-line-numbers-mode 0))))

  (defalias 'yes-or-no-p 'y-or-n-p)

  (mouse-wheel-progressive-speed nil) ;; Disable progressive speed when scrolling
  (scroll-conservatively 10) ;; Smooth scrolling
  (scroll-margin 10)

  (tab-width 4)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :bind (
         ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
         )
  ;; Fix general.el leader key not working instantly in messages buffer with evil mode
  ;; :ghook ('after-init-hook
  ;;         (lambda (&rest _)
  ;;           (when-let ((messages-buffer (get-buffer "*Messages*")))
  ;;             (with-current-buffer messages-buffer
  ;;               (evil-normalize-keymaps))))
  ;;         nil nil t)
  )

(use-package general
  :config
  (general-evil-setup)
  (general-define-key
   :states 'insert
   "C-v" 'yank)
  (general-define-key
   :keymaps 'minibuffer-mode-map
   "C-v" 'yank)
  ;; Set up 'SPC' as the leader key
  (general-create-definer start/leader-keys
    :states '(normal insert visual motion emacs)
    :keymaps 'override
    :prefix "SPC"           ;; Set leader key
    :global-prefix "C-SPC") ;; Set global leader key

  (start/leader-keys
    "p" '(projectile-command-map :wk "Projectile"))

  (start/leader-keys
    "f" '(:ignore t :wk "find")
    "f f" '(find-file :wk "Search for files")
    "f g" '(consult-ripgrep :wk "Ripgrep search in files")
    "f l" '(consult-line :wk "Find line")
    "f o" '(consult-outline :wk "Find Outline")
    "f i" '(consult-imenu :wk "Imenu buffer locations"))

  (start/leader-keys
    "E" '(:ignore t :wk "Ediff/Eshell/Eval/EWW")
    "E b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "E d" '(eval-defun :wk "Evaluate defun containing or after point")
    "E e" '(eval-expression :wk "Evaluate and elisp expression")
    "E f" '(ediff-files :wk "Run ediff on a pair of files")
    "E F" '(ediff-files3 :wk "Run ediff on three files")
    "E h" '(counsel-esh-history :which-key "Eshell history")
    "E l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "E r" '(eval-region :wk "Evaluate elisp in region")
    "E R" '(eww-reload :which-key "Reload current page in EWW")
    "E s" '(eshell :which-key "Eshell")
    "E W" '(eww-readable :which-key "Wreadble")
  "E w" '(eww :which-key "EWW emacs web wowser"))

(start/leader-keys
  "b" '(:ignore t :wk "Buffers")
  "b b" '(switch-to-buffer :wk "Switch to buffer")
  "b c" '(clone-indirect-buffer :wk "Create indirect buffer copy in a split")
  "b C" '(clean-buffer-list :wk "Clean buffer list")
  "b i" '(ibuffer :wk "Ibuffer")
  "b k" '(kill-current-buffer :wk "Kill current buffer")
  "b K" '(kill-some-buffers :wk "Kill multiple buffers")
  "b O" '(crux-kill-other-buffers :wk "Kill all other buffers")
  "b n" '(next-buffer :wk "Next buffer")
  "b p" '(previous-buffer :wk "Previous buffer")
  "b s" '(crux-create-scratch-buffer :wk "Scratch buffer")
  "b r" '(revert-buffer :wk "Reload buffer")
  "b R" '(rename-buffer :wk "Rename buffer"))

(start/leader-keys
  "d" '(:ignore t :wk "Dired")
  "d S" '(crux-sudo-edit :wk "Sudo edit file")
  "d d" '(dired :wk "Open dired")
  "d j" '(dired-jump :wk "Dired jump to current")
  "d w" '(wdired-change-to-wdired-mode :wk "Writable dired")
  "d f" '(wdired-finish-edit :wk "Writable dired finish edit"))

(start/leader-keys
  "H" '(:ignore t :wk "Help")
  "H d" '(devdocs-lookup :wk "DevDocs")
  "H c" #'(helpful-command :wk "Command")
  "H f" #'(helpful-function :wk "Function")
  "H a" #'(helpful-at-point :wk "At point")
  "H k" #'(helpful-key :wk "Key")
  "H C" #'(helpful-callable :wk "Callable")
  "H m" '(woman :wk "Man pages")
  "H v" #'(helpful-variable :wk "Variable"))

(start/leader-keys
  :keymaps 'prog-mode-map
  "e" '(:ignore t :wk "Errors")
  "e j" '(flycheck-next-error :wk "Next Error")
  "e k" '(flycheck-previous-error :wk "Next Error")
  "e l" '(flycheck-list-errors :wk "List Errors in Buffer")
  "e e" '(flycheck-explain-error-at-point :wk "Explain Error")
  "e d" '(flycheck-display-error-at-point :wk "Disply Error"))

(start/leader-keys
  :keymaps 'eglot-mode-map
  "l" '(:ignore t :wk "LSP")
  "l d" '(eglot-find-declaration :wk "Find Declaration")
  "l i" '(eglot-find-implementation :wk "Find Implementation")
  "l t" '(eglot-find-type-definition :wk "Find Type definition")
  "l I" '(eglot-code-action-organize-imports :wk "Organize Imports")
  "l a" '(eglot-code-actions :wk "Code Actions")
  "l f" '(eglot-format-buffer :wk "Format Buffer")
  "l r" '(eglot-rename  :wk "Rename"))

(start/leader-keys
  :~keymaps 'prog-mode-map
  "h" '(:ignore t :wk "Harpoon")
  "h t" '(harpoon-toggle-file :wk "Toggle file")
  "h l" '(harpoon-toggle-quick-menu :wk "List")
  "h c" '(harpoon-clear :wk "Clear")
  "h d" '(harpoon-delete-item :wk "Delete")
  "h 1" '(harpoon-go-to-1 :wk "Go to 1")
  "h 2" '(harpoon-go-to-2 :wk "Go to 2")
  "h 3" '(harpoon-go-to-3 :wk "Go to 3")
  "h 4" '(harpoon-go-to-4 :wk "Go to 4")
  "h 5" '(harpoon-go-to-5 :wk "Go to 5")
  "h 6" '(harpoon-go-to-6 :wk "Go to 6")
  "h 7" '(harpoon-go-to-7 :wk "Go to 7")
  "h 8" '(harpoon-go-to-8 :wk "Go to 8")
  "h 9" '(harpoon-go-to-9 :wk "Go to 9"))

(start/leader-keys
  "g" '(:ignore t :wk "Git")
  "g /" '(magit-displatch :wk "Magit dispatch")
  "g ." '(magit-file-displatch :wk "Magit file dispatch")
  "g b" '(magit-branch-checkout :wk "Switch branch")
  "g c" '(:ignore t :wk "Create")
  "g c b" '(magit-branch-and-checkout :wk "Create branch and checkout")
  "g c c" '(magit-commit-create :wk "Create commit")
  "g c f" '(magit-commit-fixup :wk "Create fixup commit")
  "g C" '(magit-clone :wk "Clone repo")
  "g f" '(:ignore t :wk "Find")
  "g f c" '(magit-show-commit :wk "Show commit")
  "g f f" '(magit-find-file :wk "Magit find file")
  "g f g" '(magit-find-git-config-file :wk "Find gitconfig file")
  "g F" '(magit-fetch :wk "Git fetch")
  "g g" '(magit-status :wk "Magit status")
  "g i" '(magit-init :wk "Initialize git repo")
  "g l" '(magit-log-buffer-file :wk "Magit buffer log")
  "g r" '(vc-revert :wk "Git revert file")
  "g s" '(magit-stage-file :wk "Git stage file")
  "g t" '(git-timemachine :wk "Git time machine")
  "g u" '(magit-stage-file :wk "Git unstage file"))

(start/leader-keys
  "m" '(:ignore t :wk "Misc")
  "m d" '(dashboard-open :wk "Dashboard open")

  "m c" '(:ignore t :wk "Config")
  "m c C" '(crux-recompile-init :wk "Compile Init")
  "m c o" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Open emacs config")
  "m c R" '(restart-emacs :wk "Restart emacs")
  "m c q" '(save-buffers-kill-emacs :wk "Quit Emacs and Daemon")
  "m c r" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el"))
            :wk "Reload Emacs config")

  "m T" '(:ignore t :wk "Toggle")
  "m T t" '(visual-line-mode :wk "Toggle truncated lines (wrap)")
  "m T l" '(display-line-numbers-mode :wk "Toggle line numbers"))

(start/leader-keys
  "t" '(:ignore t :wk "Terminal")
  "t t" '(eat :wk "Terminal toggle")))

(use-package evil
  :init ;; Execute code Before a package is loaded
  (evil-mode)
  :config ;; Execute code After a package is loaded
  (evil-set-initial-state 'eat-mode 'insert) ;; Set initial state in eat terminal to insert mode
  :custom ;; Customization of package custom variables
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-redo) ;; C-r to redo
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)))

(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer magit corfu vertico consult))
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode 1))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package evil-textobj-tree-sitter
  :after tree-sitter evil
  :config
  (define-key evil-outer-text-objects-map "m" (evil-textobj-tree-sitter-get-textobj "import"
                                                '((python-mode . [(import_statement) @import])
                                                  (go-mode . [(import_spec) @import])
                                                  (rust-mode . [(use_declaration) @import]))))
  (define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
  (define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))
  (define-key evil-outer-text-objects-map "c" (evil-textobj-tree-sitter-get-textobj "class.outer"))
  (define-key evil-inner-text-objects-map "c" (evil-textobj-tree-sitter-get-textobj "class.inner"))
  (define-key evil-outer-text-objects-map "C" (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-inner-text-objects-map "C" (evil-textobj-tree-sitter-get-textobj "comment.outer"))
  (define-key evil-outer-text-objects-map "o" (evil-textobj-tree-sitter-get-textobj "loop.outer"))
  (define-key evil-inner-text-objects-map "o" (evil-textobj-tree-sitter-get-textobj "loop.inner"))
  (define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj "conditional.outer"))
  (define-key evil-inner-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj "conditional.inner"))
  (define-key evil-inner-text-objects-map "r" (evil-textobj-tree-sitter-get-textobj "parameter.inner"))
  (define-key evil-outer-text-objects-map "r" (evil-textobj-tree-sitter-get-textobj "parameter.outer"))
  (define-key evil-normal-state-map (kbd "]r") (lambda () (interactive) (malb/goto-and-recenter "parameter.inner")))
  (define-key evil-normal-state-map (kbd "[r") (lambda () (interactive) (malb/goto-and-recenter "parameter.inner" t)))
  (define-key evil-normal-state-map (kbd "]R") (lambda () (interactive) (malb/goto-and-recenter "parameter.inner" nil t)))
  (define-key evil-normal-state-map (kbd "[R") (lambda () (interactive) (malb/goto-and-recenter "parameter.inner" t t)))
  (define-key evil-normal-state-map (kbd "]a") (lambda () (interactive) (malb/goto-and-recenter "conditional.outer")))
  (define-key evil-normal-state-map (kbd "[a") (lambda () (interactive) (malb/goto-and-recenter "conditional.outer" t)))
  (define-key evil-normal-state-map (kbd "]A") (lambda () (interactive) (malb/goto-and-recenter "conditional.outer" nil t)))
  (define-key evil-normal-state-map (kbd "[A") (lambda () (interactive) (malb/goto-and-recenter "conditional.outer" t t)))
  (define-key evil-normal-state-map (kbd "]c") (lambda () (interactive) (malb/goto-and-recenter "class.outer")))
  (define-key evil-normal-state-map (kbd "[c") (lambda () (interactive) (malb/goto-and-recenter "class.outer" t)))
  (define-key evil-normal-state-map (kbd "]C") (lambda () (interactive) (malb/goto-and-recenter "class.outer" nil t)))
  (define-key evil-normal-state-map (kbd "[C") (lambda () (interactive) (malb/goto-and-recenter "class.outer" t t)))
  (define-key evil-normal-state-map (kbd "]f") (lambda () (interactive) (malb/goto-and-recenter "function.outer")))
  (define-key evil-normal-state-map (kbd "[f") (lambda () (interactive) (malb/goto-and-recenter "function.outer" t)))
  (define-key evil-normal-state-map (kbd "]F") (lambda () (interactive) (malb/goto-and-recenter "function.outer" nil t)))
  (define-key evil-normal-state-map (kbd "[F") (lambda () (interactive) (malb/goto-and-recenter "function.outer" t t))))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-org-config))

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
  (dashboard-startupify-list '(   dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-items
                                  dashboard-insert-newline 
                                  dashboard-insert-init-info))
  (dashboard-startup-banner 'logo)
  :config (dashboard-setup-startup-hook))

;; (add-to-list 'default-frame-alist '(alpha-background . 90)) ;; For all new frames henceforth

(set-face-attribute 'default nil
                    ;; :font "JetBrains Mono" ;; Set your favorite type of font or download JetBrains Mono
                    :height 120
                    :weight 'medium)
;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.

;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono")) ;; Set your favorite font
(setq-default line-spacing 0.15)

(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 64
        doom-modeline-percent-position nil
        doom-modeline-position-line-format nil
        doom-modeline-buffer-encoding nil
        doom-modeline-position-column-format nil
        doom-modeline-icon t
        doom-modeline-bar-width 5))

(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-default-remote-path)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(use-package projectile
  :init
  (projectile-mode)
  :custom
  (projectile-run-use-comint-mode t) ;; Interactive run dialog when running projects inside emacs (like giving input)
  (projectile-switch-project-action #'projectile-dired) ;; Open dired when switching to a project
  (projectile-project-search-path '("~/projects/" "~/work/" ("~/GitHub" . 1)))) ;; . 1 means only search the first subdirectory level for projects
;; Use Bookmarks for smaller, not standard projects

(use-package eglot
  :ensure nil ;; Don't install eglot because it's now built-in
  :config
  (evil-define-key 'normal 'eglot-mode-map
    "K" 'eldoc-box-help-at-point)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'php-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (fset #'jsonrpc--log-event #'ignore)
  (eglot-events-buffer-size 0) ;; No event buffers (Lsp server logs)
  (eglot-report-progress nil)
  (eglot-events-buffer-size 0)
  (eglot-sync-connect nil)
  (eglot-extend-to-xref nil))

(use-package yasnippet-snippets
  :hook (prog-mode . yas-minor-mode))

(use-package lua-mode
  :mode "\\.lua\\'") ;; Only start in a lua file

(use-package php-mode
  :mode "\\.php\\'") ;; Only start in a php file

;; Install and configure go-mode for Go programming.
(use-package go-mode
  :mode "\\.go\\'")

(use-package org
  :ensure nil
  :custom
  (org-edit-src-content-indentation 4) ;; Set src block automatic indent to 4 instead of 2.

  :hook
  (org-mode . org-indent-mode))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-tempo
  :ensure nil
  :after org)

(use-package org-modern
  :hook (org-mode . org-modern-mode))

;; (use-package org-excalidraw
;;   :straight (:type git :host github :repo "wdavew/org-excalidraw")
;;   :config
;;   (org-excalidraw-directory "~/path_to_store_excalidraw_files"))

(defun start/org-mode-visual-fill ()
  (setq visual-fill-column-width 200
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . start/org-mode-visual-fill))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(use-package flycheck)

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package tree-sitter
  :config(global-tree-sitter-mode
          (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)))

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (bash-mode . bash-ts-mode)
        (js2-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode . json-ts-mode)
        ;; (php-mode . php-ts-mode)
        ;; (go-mode . go-ts-mode)
        (css-mode . css-ts-mode)
        (python-mode . python-ts-mode)))

(use-package tree-sitter-langs
  :after tree-sitter)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (php "https://github.com/tree-sitter/tree-sitter-php" "master" "php/src")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(setq treesit-auto-langs '(python rust go php))

;; Debug with DAP without LspMode
;; (use-package dape)

(use-package eat
  :hook ('eshell-load-hook #'eat-eshell-mode))

(use-package magit
  :commands magit-status)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-gutter
  :config(global-git-gutter-mode +1))

(use-package diff-hl
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(use-package devdocs)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package dired
  :after evil-collection
  :ensure nil
  :commands (dired dired-jump)
  :custom
  (setq delete-by-moving-to-trash t)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file
    dired-listing-switches "-agho --group-directories-first"))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map "H" 'dired-hide-dotfiles-mode))

(use-package drag-stuff
  :config
  (evil-define-key 'normal 'prog-mode-map (kbd "C-j") 'drag-stuff-down)
  (evil-define-key 'normal 'prog-mode-map (kbd "C-k") 'drag-stuff-up))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle nil)
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-prefix 2)          ;; Minimum length of prefix for auto completion.
  (corfu-popupinfo-mode t)       ;; Enable popup information
  (corfu-popupinfo-delay 0.15)   ;; Lower popupinfo delay to 0.15 seconds from 2 seconds
  (corfu-separator ?\s)          ;; Orderless field separator, Use M-SPC to enter separator

  (corfu-count 14)
  (corfu-scroll-margin 4)        ;; Use scroll margin
  (completion-ignore-case t)
  (tab-always-indent 'complete)
  (corfu-preview-current nil) ;; Don't insert completion without confirmation
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
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil)  ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev) ;; Complete word from current buffers
  (add-to-list 'completion-at-point-functions #'cape-dict) ;; Dictionary completion
  (add-to-list 'completion-at-point-functions #'cape-file) ;; Path completion
  (add-to-list 'completion-at-point-functions #'cape-elisp-block) ;; Complete elisp in Org or Markdown mode
  (add-to-list 'completion-at-point-functions #'cape-keyword) ;; Keyword/Snipet completion

  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev) ;; Complete abbreviation
  (add-to-list 'completion-at-point-functions #'cape-history) ;; Complete from Eshell, Comint or minibuffer history
  ;;(add-to-list 'completion-at-point-functions #'cape-line) ;; Complete entire line from current buffer
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol) ;; Complete Elisp symbol
  ;;(add-to-list 'completion-at-point-functions #'cape-tex) ;; Complete Unicode char from TeX command, e.g. \hbar
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml) ;; Complete Unicode char from SGML entity, e.g., &alpha
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345) ;; Complete Unicode char using RFC 1345 mnemonics
  )

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :bind (:map vertico-map
              ("<tab>" . vertico-insert)
              ("C-j" . vertico-next)
              ("C-K" . vertico-previous))
  :custom
  (vertico-cycle t)
  (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :init
  (vertico-mode))

(savehist-mode) ;; Enables save history mode

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))

;; Configure tempel for templating support.
(use-package tempel
  :bind (("M-." . tempel-complete))
  :init
  ;; Set up tempel for different modes.
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))
  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf))

;; Install tempel-collection for additional templates.
(use-package tempel-collection
  :after tempel)

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
  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))

  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  ;; (consult-customize
  ;; consult-theme :preview-key '(:debounce 0.2 any)
  ;; consult-ripgrep consult-git-grep consult-grep
  ;; consult-bookmark consult-recent-file consult-xref
  ;; consult--source-bookmark consult--source-file-register
  ;; consult--source-recent-file consult--source-project-recent-file
  ;; :preview-key "M-."
  ;; :preview-key '(:debounce 0.4 any))

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
   ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
   ;;;; 2. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
   ;;;; 3. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
   ;;;; 4. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
   ;;;; 5. No project support
  ;; (setq consult-project-function nil)
  )

(use-package diminish)

(setq eldoc-echo-area-use-multiline-p nil)

(use-package eldoc-box
  :config
  (setq eldoc-box-cleanup-interval 3))

(use-package helpful)

(use-package which-key
  :init
  (which-key-mode 1)
  :diminish
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha) ;; Same as default, except single characters are sorted alphabetically
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1) ;; Number of spaces to add to the left of each column
  (which-key-min-display-lines 6)  ;; Increase the minimum lines to display, because the default is only 1
  (which-key-idle-delay 0.8)       ;; Set the time delay (in seconds) for the which-key popup to appear
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit nil)) ;; Fixes which-key window slipping out in Emacs Daemon

(use-package system-packages)

(use-package crux)

(use-package no-littering)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb
