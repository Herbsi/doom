;;; config.el -*- lexical-binding: t; -*-

;;; Personal Information
(setq user-full-name "Herwig"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to "9C167EE7C9D3CA5D8C35807A1DCF474EE53A950D")


;;; Security
(setq auth-sources '("~/.secrets/authinfo.gpg")
      auth-source-cache-expiry nil)


;;; Better Defaults
(setq-default
 uniquify-buffer-name-style 'forward    ; Uniquify buffer names
 window-combination-resize t)           ; Take new window space from all other windows (not just current)

(setq sentence-end-double-space t            ; the only correct choice
 auto-save-default t
 confirm-kill-emacs nil                      ; Don't ask me if I want to quit
 evil-want-fine-undo t                       ; the finer the undo, the better
 inhibit-compacting-font-caches t            ; when there are a lot of glyphs, keep them in memory
 +evil-want-o/O-to-continue-comments nil)    ;

(delete-selection-mode +1)              ; Replace selection when inserting text
(global-subword-mode +1)                ; Iterate through CamelCase words
;; (global-hl-line-mode +1)                ; Highlight cursor line

;; Use hard line breaks in text-mode (LaTeX in particular)
;; because it makes it easier to navigate
(remove-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)

;; Save auto-customisations in separate file
(setq-default custom-file (expand-file-name ".custom.el" doom-private-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; Split windows to the right and bottom
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Automatically save files
(use-package super-save
  :defer 1
  :diminish super-save-mode
  :config
  (super-save-mode +1))


;;; UI
(setq display-line-numbers-type nil)     ; Don’t display line numbers for performance


;; Font
(setq doom-font (font-spec :family "Triplicate T4c" :size 14.0)
      doom-variable-pitch-font (font-spec :family "Triplicate T4p" :size 14.0))

;; Theme
(setq doom-theme 'doom-dracula)
(add-hook 'ns-system-appearance-change-functions
          (lambda (appearance)
            (pcase appearance
              ('light (load-theme 'doom-nord t))
              ('dark (load-theme 'doom-dracula t)))))


(load! "+anki-editor.el")
(load! "+bindings.el")
(load! "+calc.el")
(load! "+company.el")
(load! "+git.el")
(load! "+hercules.el")
(load! "+latex.el")
(load! "+ledger.el")
(load! "+lispy.el")
(load! "+markdown.el")
(load! "+org.el")
(load! "+racket.el")
(load! "+spell.el")
(load! "+scheme.el")
(load! "+snippets.el")
(load! "+which-key.el")
