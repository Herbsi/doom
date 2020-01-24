;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+org")

;;; General Configuration
(setq user-full-name "Herwig Hoehenberger"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to user-mail-address
      confirm-kill-emacs nil)

(toggle-frame-fullscreen)


;;; UI
(setq column-number-mode nil
      display-line-numbers-type nil
      doom-font (font-spec :family "Source Code Pro" :size 13.0)
      doom-unicode-font (font-spec :family "Source Code Pro" :size 13.0)
      doom-theme 'doom-nord
      evil-echo-state nil
      frame-title-format "%b"
      lsp-ui-sideline-enable nil
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)

(setq-default line-spacing 2)

;;; Emacs Calc, poor man's Mathematica
(after! calc
  (evil-set-initial-state 'calc-mode 'emacs))


;;; Text & Input
(setq sentence-end-double-space t       ; the only correct choice
      mac-command-modifier 'control
      default-input-method "german-postfix")


;;; Packages
;; Common Lisp
(add-hook! lisp-mode lispy-mode)


;; Company
(after! company
  (setq company-idle-delay nil))


;; Editorconfig
(after! editorconfig
  (add-hook! before-save (editorconfig-format-buffer)))


;; Evil
(after! evil
  (setq evil-magic 'very-magic
        evil-split-window-below t
        evil-vsplit-window-right t
        +evil-want-o/O-to-continue-comments nil))


;; Fastscroll
(after! fastscroll
  (fast-scroll-config)
  (fast-scroll-mode 1))


;; Flyspell in text mode
(add-hook! text-mode #'flyspell-mode)


;; Git
(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))


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


;; Super Save
(use-package! super-save
  :hook (prog-mode . super-save-mode)
  :config
  (setq super-save-auto-save-when-idle t
        super-save-remote-files nil
        super-save-exclude '(".gpg")))
