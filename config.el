;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+org")

;;; General Configuration
(setq user-full-name "Herwig Hoehenberger"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to user-mail-address)


;;; UI
(setq column-number-mode nil
      display-line-numbers-type nil
      doom-font (font-spec :family "Fira Code Nerd Font" :size 11.0)
      doom-theme 'doom-monokai-spectrum
      evil-echo-state nil
      frame-title-format "%b"
      lsp-ui-sideline-enable nil
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0
      uniquify-buffer-name-style 'forward
      window-combination-resize t
      x-stretch-cursor t
      +ivy-buffer-preview t)


;;; Emacs Calc, poor man's Mathematica
(after! calc
  (setq calc-angle-mode 'rad
        calc-algebraic-mode t
        calc-symbolic-mode t)
  (evil-set-initial-state 'calc-mode 'emacs))


;;; Text & Input
(setq sentence-end-double-space t       ; the only correct choice
      default-input-method "german-postfix"
      undo-limit 80000000
      evil-want-fine-undo t
      auto-save-default t
      inhibit-compacting-font-caches t)
(delete-selection-mode 1)
(global-subword-mode)


;;; Packages
;; Company
(after! company
  (setq company-idle-delay nil))


;; Direnv
(setq direnv-always-show-summary nil)


;; Evil
(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t
        evil-want-fine-undo t
        +evil-want-o/O-to-continue-comments nil))

(after! evil-tex
  (add-hook! latex-mode #'evil-tex-mode))


;; Git
(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))


;; Haskell
(after! haskell
  (setq haskell-interactive-popup-errors nil))


;; Hercules
(use-package! hercules
  :config
  (hercules-def
   :show-funs #'macrostep-expand
   :hide-funs #'macrostep-collapse-all
   :keymap 'macrostep-keymap))


;; Python
(after! python
  (setq python-shell-interpreter "ipython"))


;; Scheme
(after! geiser
  (setq geiser-active-implementations '(mit)
        geiser-default-implementation 'mit))


;; Snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))


;; Which Key
(after! which-key
  (setq which-key-idle-delay 0.5)
  (setq which-key-allow-multiple-replacements t)
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))
