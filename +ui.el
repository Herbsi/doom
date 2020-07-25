;;; +ui.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Fira Code" :size 13.0)
      doom-big-font (font-spec :family "Fira Code" :size 18.0)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 13.0)
      zenburn-use-variable-pitch t)

;; Theme
(setq doom-theme (if (string= "herwig" user-login-name) 'doom-nord 'doom-zenburn))

;; Misc
(setq display-line-numbers-type nil
      evil-echo-state nil                      ; I find it distracting; and I can tell the state from the cursor
      frame-title-format "%b"
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
