;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+org")

;;; General Configuration
(setq user-full-name "Herwig Hoehenberger"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to user-mail-address
      confirm-kill-emacs nil)
(server-start)


;;; UI
(setq doom-font (font-spec :family "Fira Code" :size 12.0)
      doom-unicode-font (font-spec :family "Fira Code" :size 12.0)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13)
      doom-theme 'doom-city-lights
      column-number-mode nil
      display-line-numbers-type nil
      evil-echo-state nil
      frame-title-format "%b"
      lsp-ui-sideline-enable nil
      mode-line-default-help-echo nil
      show-help-function nil
      show-paren-delay 0)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


;;; Emacs Calc, poor man's Mathematica
(after! calc
  (evil-set-initial-state 'calc-mode 'emacs))


;;; Text & Input
(setq mac-command-modifier 'control
      sentence-end-double-space t       ; the only correct choice
      default-input-method "german-postfix")


;;; Packages
;; Common Lisp
(add-hook! lisp-mode lispy-mode)


;; Company
(after! company
  (setq company-idle-delay 0))


;; Editorconfig
(after! editorconfig-mode
    (add-hook! before-save (editorconfig-format-buffer)))


;; Evil
(setq evil-magic 'very-magic
      evil-split-window-below t
      evil-vsplit-window-right t
      +evil-want-o/O-to-continue-comments nil)


;; Fastscroll
(after! fastscroll
  (fast-scroll-config)
  (fast-scroll-mode 1))


;; Flyspell in text mode
(add-hook! text-mode #'flyspell-mode)


;; Lispy
(after! lispyville
  (setq lispyville-barf-stay-with-closing t)
  (lispyville-set-key-theme
    '(additional-movement)))


;; Python
(after! python
  (setq python-shell-interpreter "python3"))


;; Scheme
(after! geiser
  (setq geiser-active-implementations '(mit)
        geiser-default-implementation 'mit))


;; Snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
