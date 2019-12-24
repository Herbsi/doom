;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+org")

;; General Configuration
(setq user-full-name "Herwig Hoehenberger"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to user-mail-address)
(server-start)

;; UI
(setq doom-font (font-spec :family "Fira Code" :size 12.0)
      doom-unicode-font (font-spec :family "Fira Code" :size 12.0)
      doom-theme 'doom-one
      column-number-mode nil
      display-line-numbers-type nil
      evil-echo-state nil
      frame-title-format "%b"
      lsp-ui-sideline-enable nil
      show-paren-delay 0)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(after! fastscroll
  (fast-scroll-config)
  (fast-scroll-mode 1))

;; Emacs Calc, poor man's Mathematica
(evil-set-initial-state 'calc-mode 'emacs)


;; Text & Input
(setq mac-command-modifier 'control)
(setq +evil-want-o/O-to-continue-comments nil)

(setq evil-magic 'very-magic)

(setq sentence-end-double-space t) ; the only correct choice
(setq default-input-method "german-postfix")

;; Packages
;; Common Lisp
(add-hook! lisp-mode lispy-mode)

;; Company
(after! company
  (setq company-idle-delay 0))

;; Editorconfig
(after! editorconfig-mode
    (add-hook! before-save (editorconfig-format-buffer)))

;; flyspell in text mode
(add-hook! text-mode #'flyspell-mode)

;; Lispy
(after! lispyville
  (setq lispyville-barf-stay-with-closing t)
  (lispyville-set-key-theme
    '(additional-movement)))


;; Python
(after! python-mode
  (setq python-shell-interpreter "python3"))

;; Scheme
(setq geiser-active-implementations '(mit)
      geiser-default-implementation 'mit)

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
