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
      display-line-numbers-type nil
      frame-title-format "%b")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq lsp-ui-sideline-enable nil)

;; Text & Input
(setq sentence-end-double-space t) ; the only correct choice
(setq default-input-method "german-postfix")

;; Packages
;; Regex Replace
(use-package! visual-regexp
  :config
  (map!
   :leader
   (:prefix ("/" . "search")
     :desc "Regex Replace"      "r" #'vr/replace
     :desc "Regex Query Replae" "q" #'vr/query-replace)))

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

;; C++
(after! c++-mode
  (defvar +cc-default-header-file-mode 'c++-mode
    "Fallback major mode for .h files if all other heuristics fail (in
    `+cc-c-c++-objc-mode')."))

;; Editorconfig
(use-package! editorconfig
  :config
  (when (featurep! :editor format +onsave)
    (add-hook! before-save (editorconfig-format-buffer))))

;; flyspell in text mode
(when (featurep! :tools flyspell)
  (add-hook! text-mode #'flyspell-mode))

;; Python
(after! python-mode
  (setq python-shell-interpreter "python3"))

;; Load snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))
