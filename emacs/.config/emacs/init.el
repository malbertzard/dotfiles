;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

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

;; (use-package emacs
;;   :straight nil
;;   :after org-mode
;;   :custom)
;; (defun start/org-babel-tangle-config ()
;;   "Automatically tangle our Emacs.org config file when we save it. Credit to Emacs From Scratch for this one!"
;;   (when (string-equal (file-name-directory (buffer-file-name))
;;                       (expand-file-name user-emacs-directory))
;;     ;; Dynamic scoping to the rescue
;;     (let ((org-confirm-babel-evaluate nil))
;;       (org-babel-tangle))))

;; (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'start/org-babel-tangle-config)))

(setq straight-use-package 'use-package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(use-package no-littering
  :straight t
  :config
  (no-littering-theme-backups)

  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))

  (setq create-lockfiles nil)

  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

  (require 'recentf)
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-var-directory))
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-etc-directory)))

(use-package system-packages
  :straight t)

(use-package diminish
  :straight t)

(use-package emacs
  :custom
  (menu-bar-mode nil)         ;; Disable the menu bar
  (scroll-bar-mode nil)       ;; Disable the scroll bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  (inhibit-startup-screen t)  ;; Disable welcome screen

  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing
  (display-battery-mode t)

  (ring-bell-function 'ignore)
  (blink-cursor-mode nil)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  (dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  (truncate-lines t)
  (gnus-agent nil)
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
  
  ;; (split-height-threshold nil) ;;Default split vertical
  ;; (split-width-threshold 0)

  (tab-width 4)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  ;; (custom-file (locate-user-emacs-file "custom-vars.el"))
  ;; (load custom-file 'noerror 'nomessage)
  :bind (
         ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
         )
  ;; Fix general.el leader key not working instantly in messages buffer with evil mode
  )

(use-package general
  :straight t
  :after evil
  :config
  (general-evil-setup)
  (general-define-key
   :states 'insert
   "C-v" 'yank)

  (general-define-key
   :states 'normal
   "C-." 'embark-act)
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
    "P" '(perspective-map :wk "Perspective"))

  (start/leader-keys
    "n" '(:ignore t :wk "Notes")
    "n d" '(org-roam-dailies-map :wk "Dailies")
    "n u" '(org-roam-ui-open :wk "UI open")
    "n i" '(org-roam-node-insert :wk "Insert node")
    "n f" '(org-roam-node-find :wk "Find node")
    "n c" '(org-roam-capture :wk "Capture")
    "n s" '(consult-org-roam-search :wk "Search")
    "n S" '(:ignore t :wk "Show")
    "n S b" '(consult-org-roam-backlinks :wk "Show backlinks")
    "n S f" '(consult-org-roam-forward-links :wk "Show forward links")
    "n C" '(:ignore t :wk "Citar")
    "n C t" '(citar-org-roam-open-current-refs :wk "Open this")
    "n C o" '(citar-open-note :wk "Open Note")
    "n C O" '(citar-open :wk "Open Entry")
    "n C i" '(:ignore t :wk "Citar insert")
    "n C i k" '(citar-insert-keys :wk "Insert keys")
    "n C i c" '(citar-insert-citation :wk "Insert citation")
    "n C i c" '(citar-insert-reference :wk "Insert references"))

  (start/leader-keys
    "f" '(:ignore t :wk "find")
    "f f" '(find-file :wk "Search for files")
    "f g" '(consult-ripgrep :wk "Ripgrep search in files")
    "f l" '(consult-line :wk "Find line")
    "f o" '(consult-outline :wk "Find Outline")
    "f i" '(consult-imenu :wk "Imenu buffer locations"))

  (start/leader-keys
    "C" '(:ignore t :wk "Compile")
    "C o" '(compile-or-open :wk "Compile or open")
    "C c" '(projectile-compile-project :wk "Compile Project")
    "C r" '(recompile :wk "Recompile")
    "C k" '(kill-compilation :wk "Kill compilation")
    "C s" '(:ignore t :wk "Switch")
    "C s i" '(comint-mode :wk "Make interactive mode")
    "C s c" '(compilation-mode :wk "Make compilation mode")
    "C e" '(:ignore t :wk "Errors")
    "C e l" '(consult-compile-error :wk "List compile errors")
    "C e j" '(compilation-next-error :wk "Next compile error")
    "C e k" '(compilation-previous-error :wk "Previous compile error"))

  (start/leader-keys
    "b" '(:ignore t :wk "Buffers")
    "b b" '(consult-buffer :wk "Switch to buffer")
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
    ;; :keymaps 'prog-mode-map
    "h" '(:ignore t :wk "Harpoon")
    "h a" '(harpoon-add-file :wk "Add file")
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
    "m T l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "m E" '(:ignore t :wk "Ediff/Eshell/Eval/EWW")
    "m E b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "m E d" '(eval-defun :wk "Evaluate defun containing or after point")
    "m E e" '(eval-expression :wk "Evaluate and elisp expression")
    "m E f" '(ediff-files :wk "Run ediff on a pair of files")
    "m E F" '(ediff-files3 :wk "Run ediff on three files")
    "m E h" '(counsel-esh-history :which-key "Eshell history")
    "m E l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "m E r" '(eval-region :wk "Evaluate elisp in region")
    "m E R" '(eww-reload :which-key "Reload current page in EWW")
    "m E s" '(eshell :which-key "Eshell")
    "m E W" '(eww-readable :which-key "Wreadble")
    "m E w" '(eww :which-key "EWW emacs web wowser"))

  (start/leader-keys
    "u" '(:ignore t :wk "Undo")
    "u t" '(undo-tree-visualize :wk "Undo Tree Visualize"))

  (start/leader-keys
    "t" '(:ignore t :wk "Terminal")
    "t P" '(eat-project :wk "Terminal project toggle full")
    "t p" '(eat-project-other-window :wk "Terminal project toggle")
    "t T" '(eat :wk "Terminal toggle full")
    "t t" '(eat-other-window :wk "Terminal toggle")))

(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-default-remote-path)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(setq calendar-week-start-day 1)

(setq eww-retrieve-command
      '("chromium" "--headless" "--dump-dom"))

(use-package dired
  :after evil-collection
  :straight nil
  :commands (dired dired-jump)
  :config
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches "-aBhl  --group-directories-first"))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :straight t
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map "H" 'dired-hide-dotfiles-mode))

(use-package doom-themes
  :straight t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t)
  (doom-themes-org-config))

(use-package dashboard
  :straight t
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
  :straight nil
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(use-package nerd-icons
  :straight t
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :straight t
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :straight t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 42
        doom-modeline-percent-position nil
        doom-modeline-position-line-format nil
        doom-modeline-buffer-encoding nil
        doom-modeline-position-column-format nil
        doom-modeline-battery t
        doom-modeline-icon t
        doom-modeline-bar-width 5))

(use-package which-key
  :straight t
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

(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil
  :straight t
  :config ;; Execute code After a package is loaded
  (evil-mode)
  (evil-set-initial-state 'eat-mode 'insert) ;; Set initial state in eat terminal to insert mode
  :custom ;; Customization of package custom variables
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-tree) ;; C-r to redo
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)))

(use-package evil-collection
  :straight t
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(
        dired
        wdired
        wgrep
        magit
        ibuffer
        corfu
        vertico
        consult
        compile
        dape
        docker
        eglot
        pdf
        doc-view
        eww
        org-roam
        flycheck
        ediff
        diff-mode
        diff-hl
        proced
        calc
        embark))
  (evil-collection-init))

(use-package evil-surround
  :straight t
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar
  :straight t
  :config
  (global-evil-visualstar-mode 1))

(use-package evil-commentary
  :straight t
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package evil-textobj-tree-sitter
  :straight t
  :after tree-sitter evil
  :config
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

(use-package undo-tree
  :straight t
  :config (global-undo-tree-mode))

(use-package drag-stuff
  :straight t
  :config
  (evil-define-key 'normal 'prog-mode-map (kbd "C-j") 'drag-stuff-down)
  (evil-define-key 'normal 'prog-mode-map (kbd "C-k") 'drag-stuff-up))

;; Configure tempel for templating support.
(use-package tempel
  :straight t
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
  :straight t
  :after tempel)

(use-package harpoon
  :straight t)

(use-package wgrep
  :straight t
  :bind ( :map grep-mode-map
          ("e" . wgrep-change-to-wgrep-mode)
          ("C-x C-q" . wgrep-change-to-wgrep-mode)
          ("C-c C-c" . wgrep-finish-edit)))

(use-package corfu
  :straight t
  :after orderless
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
  :straight t
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package kind-icon
  :straight t
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil)  ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :straight t
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
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :straight t
  :bind (:map vertico-map
              ("<tab>" . vertico-insert)
              ("C-j" . vertico-next)
              ("C-f" . vertico-exit)
              ("C-K" . vertico-previous))
  :custom
  (vertico-cycle t)
  (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  :init
  (vertico-mode))

(savehist-mode) ;; Enables save history mode

(use-package marginalia
  :straight t
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :straight t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))

(use-package consult
  :straight t
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

(setq eldoc-echo-area-use-multiline-p nil)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose)

(setq eldoc-idle-delay 0.5)

(use-package eldoc-box
  :straight t
  :config
  ;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode nil)
  (setq eldoc-box-hover-mode nil)
  (setq eldoc-box-cleanup-interval 3))

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

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

(use-package flycheck
  :straight t)

(use-package flycheck-eglot
  :straight t
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

(use-package eglot
  :straight nil ;; Don't install eglot because it's now built-in
  :config
  (evil-define-key 'normal 'eglot-mode-map
    "K" 'eldoc-box-help-at-point)
  (add-hook 'go-ts-mode-hook 'eglot-ensure)
  (add-hook 'ruby-ts-mode-hook 'eglot-ensure)
  (add-hook 'python-ts-mode-hook 'eglot-ensure)
  (add-hook 'rust-ts-mode-hook 'eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (fset #'jsonrpc--log-event #'ignore)
  (eglot-events-buffer-size 0) ;; No event buffers (Lsp server logs)
  (eglot-report-progress nil)
  (eglot-events-buffer-size 0)
  (eglot-sync-connect nil)
  (eglot-extend-to-xref nil))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(gdscript-mode . ("localhost:6005"))))

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

(use-package dape
  :straight t
  :config 
  (setq dape-cwd-fn 'projectile-project-root)
  (setq dape-buffer-window-arrangement 'right))

(defun pyrightconfig-write (virtualenv)
  (interactive "DEnv: ")

  (let* (;; file-truename and tramp-file-local-name ensure that neither `~' nor
		 ;; the Tramp prefix (e.g. "/ssh:my-host:") wind up in the final
		 ;; absolute directory path.
		 (venv-dir (tramp-file-local-name (file-truename virtualenv)))

		 ;; Given something like /path/to/.venv/, this strips off the trailing `/'.
		 (venv-file-name (directory-file-name venv-dir))

		 ;; Naming convention for venvPath matches the field for
		 ;; pyrightconfig.json.  `file-name-directory' gets us the parent path
		 ;; (one above .venv).
		 (venvPath (file-name-directory venv-file-name))

		 ;; Grabs just the `.venv' off the end of the venv-file-name.
		 (venv (file-name-base venv-file-name))

		 ;; Eglot demands that `pyrightconfig.json' is in the project root
		 ;; folder.
		 (base-dir (vc-git-root default-directory))
		 (out-file (expand-file-name "pyrightconfig.json" base-dir))

		 ;; Finally, get a string with the JSON payload.
		 (out-contents (json-encode (list :venvPath venvPath :venv venv))))

	;; Emacs uses buffers for everything.  This creates a temp buffer, inserts
	;; the JSON payload, then flushes that content to final `pyrightconfig.json'
	;; location
	(with-temp-file out-file (insert out-contents))))

;; (use-package zig-mode
;;   :straight t)

(use-package zig-ts-mode
  :straight (:type git :host github :repo "malbertzard/zig-ts-mode"))

(use-package gdscript-mode
  :straight (gdscript-mode
             :type git
             :host github
             :repo "godotengine/emacs-gdscript-mode")
  :hook (gdscript-mode . eglot-ensure))

(setq lsp-gdscript-port 6008)

(use-package editorconfig
  :straight t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package eat
  :straight t
  :hook ('eshell-load-hook #'eat-eshell-mode))

(use-package elfeed
  :straight t
  :config
  (setf url-queue-timeout 30)
  (setq-default elfeed-search-filter "@1-week-ago +unread ")
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :feed-url "youtube\\.com"
                                :add '(video youtube)))
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
                                :remove 'unread)))

(setq elfeed-feeds
      '(
        ("https://tympanus.net/codrops/feed" frontend blog)
        ))

(use-package citar
  :straight t
  :custom
  (citar-bibliography '("~/bib/Zotero.bib")))

(use-package citar-org-roam
  :straight t
  :after (citar org-roam)
  :config
  (citar-org-roam-mode)
  (setq citar-org-roam-capture-template-key "n"))

(use-package magit
  :straight t
  :commands magit-status)

(use-package magit-todos
  :straight t
  :after magit
  :config (magit-todos-mode 1))

(use-package git-gutter
  :straight t
  :config(global-git-gutter-mode +1))

(use-package diff-hl
  :straight t
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(use-package projectile
  :straight t
  :init
  (projectile-mode)
  :custom
  (projectile-run-use-comint-mode t) ;; Interactive run dialog when running projects inside emacs (like giving input)
  (projectile-switch-project-action #'projectile-dired) ;; Open dired when switching to a project
  (projectile-project-search-path '("~/projects/" "~/work/" ("~/code" . 2)))) ;; . 1 means only search the first subdirectory level for projects

;; Use Bookmarks for smaller, not standard projects

(setq persp-suppress-no-prefix-key-warning 't)
(use-package perspective
  :straight t
  :init
  (persp-mode))

(use-package persp-projectile
  :straight t)

(use-package docker
  :straight t
  :bind ("C-c d" . docker))

(use-package crux
  :straight t)

(use-package embark
  :straight t
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
         ("C-c C-c" . embark-collect)
         ("C-c C-e" . embark-export)))

(use-package embark-consult
  :straight t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package helpful
  :straight t)

(use-package devdocs
  :straight t)

(use-package pdf-tools
  :straight t
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1))))

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-down)))

(use-package poly-markdown
  :straight t)

(use-package quarto-mode
  :straight t
  :mode (("\\.Rmd" . poly-quarto-mode)))

(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . poly-quarto-mode))

(use-package org
  :straight nil
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

;; (use-package org-noter
;;   :straight t
;;   :after org)

(use-package toc-org
  :straight t
  :after org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-download
  :straight t
  :after  org
  :config (add-hook 'dired-mode-hook 'org-download-enable))

(use-package org-roam
  :straight t
  :after org
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/code/Cadmus")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :if-new
      (file+head "2_Areas/Fleeting/${slug}.org"
                 "#+title: ${title}\n#+created: %U\n#+filetags: :fleeting: \n\n")
      :unnarrowd t)
     ("n" "literature note" plain
      "%?"
      :target
      (file+head
       "%(expand-file-name org-roam-directory)/3_Resources/Literature/${citar-citekey}.org"
       "#+title: ${note-title}\n#+created: %U\n#+filetags: :literatur:resource: \n\n")
      :unnarrowed t)
     ("p" "project" plain "%?"
      :if-new
      (file+head "1_Projects/${slug}.org"
                 "#+title: ${title}\n#+created: %U\n#+filetags: :project: \n\n")
      :unnarrowd t)
     ("a" "area" plain "%?"
      :if-new
      (file+head "2_Areas/${slug}.org"
                 "#+title: ${title}\n#+created: %U\n#+filetags: :area: \n\n")
      :unnarrowd t)
     ("r" "resource" plain "%?"
      :if-new
      (file+head "3_Resources/${slug}.org"
                 "#+title: ${title}\n#+created: %U\n#+filetags: :resource: \n\n")
      :unnarrowd t)))
  :config
  (setq org-roam-db-gc-threshold most-positive-fixnum)
  (setq org-roam-dailies-directory "2_Areas/journal/")
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :straight t
  :after  org org-roam)

(use-package consult-org-roam
  :straight t
  :after org-roam
  :init
  (require 'consult-org-roam)
  ;; Activate the minor mode
  (consult-org-roam-mode 1)
  :custom
  ;; Use `ripgrep' for searching with `consult-org-roam-search'
  (consult-org-roam-grep-func #'consult-ripgrep)
  ;; Configure a custom narrow key for `consult-buffer'
  (consult-org-roam-buffer-narrow-key ?r)
  ;; Display org-roam buffers right after non-org-roam buffers
  ;; in consult-buffer (and not down at the bottom)
  (consult-org-roam-buffer-after-buffers t))

(defun start/org-mode-visual-fill ()
  (setq visual-fill-column-width 200
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :straight t
  :after  org
  :hook (org-mode . start/org-mode-visual-fill))

(use-package org-modern
  :straight t
  :after  org
  :hook (org-mode . org-modern-mode))

(use-package restclient
  :straight t
  :mode (("\\.http\\'" . restclient-mode)))

(use-package theme-magic
  :straight t)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb
