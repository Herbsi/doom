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
      doom-font (font-spec :family "Fira Code" :size 11.0)
      doom-theme 'doom-monokai-spectrum
      evil-echo-state nil
      frame-title-format "%b"
      lsp-ui-sideline-enable nil
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)

;;; Emacs Calc, poor man's Mathematica
(after! calc
  (evil-set-initial-state 'calc-mode 'emacs))


;;; Text & Input
(setq sentence-end-double-space t       ; the only correct choice
      ispell-aspell-dict-dir (expand-file-name "aspell" (getenv "XDG_DATA_HOME"))
      ispell-personal-dictionary (expand-file-name "aspell/en.pws" (getenv "XDG_DATA_HOME"))
      default-input-method "german-postfix")
(delete-selection-mode 1)


;;; Packages
;; Company
(after! company
  (setq company-idle-delay nil))


;; Direnv
(setq direnv-always-show-summary nil)


;; Emacs Anywhere
(add-hook! ea-popup
  (latex-mode)
  (set-input-method "german-postfix"))


;; Evil
(after! evil
  (setq evil-magic 'very-magic
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-want-fine-undo t
        +evil-want-o/O-to-continue-comments nil))


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


;; Lispy
(after! lispyville
  (setq lispyville-barf-stay-with-closing t)
  (lispyville-set-key-theme
   '(additional-movement)))


;; imenu-list
(set-popup-rule! "^\\*Ilist" :side 'right :size 0.3 :quit 'other :select t)
(use-package! imenu-list
  :config
  (map!
   :leader
   (:prefix ("b" . "buffer")
     :desc "imenu-list" "I" #'imenu-list-smart-toggle)))


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
