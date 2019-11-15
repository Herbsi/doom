;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

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
      doom-theme 'doom-nord
      column-number-mode nil
      display-line-numbers-type nil
      evil-echo-state nil
      lsp-ui-sideline-enable nil
      frame-title-format "%b")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(after! fastscroll
  (fast-scroll-config)
  (fast-scroll-mode 1))

;; Text & Input
(when (featurep! :editor evil)
  (setq +evil-want-o/O-to-continue-comments nil))

(setq sentence-end-double-space t) ; the only correct choice
(setq default-input-method "german-postfix")

;; Packages

;; Common Lisp
(after! lisp-mode
  (when (featurep! :editor lispy)
    (add-hook! lisp-mode lispy-mode)))
;; Company
(after! company
  (setq company-idle-delay 0.001
        company-minimum-prefix-length 2))

;; Editorconfig
(use-package! editorconfig
  :config
  (when (featurep! :editor format +onsave)
    (add-hook! before-save (editorconfig-format-buffer))))

;; flyspell in text mode
(when (featurep! :tools flyspell)
  (add-hook! text-mode #'flyspell-mode))

;; Lispy
(when (featurep! :editor lispy)
  (setq lispyville-barf-stay-with-closing t))

;; Python
(after! python-mode
  (setq python-shell-interpreter "python3"))

;; Regex Replace
(use-package! visual-regexp
  :config
  (map!
   :leader
   (:prefix ("/" . "search")
     :desc "Regex Replace"      "r" #'vr/replace
     :desc "Regex Query Replae" "q" #'vr/query-replace)))

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
