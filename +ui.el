;;; +ui.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Fira Mono" :size 14.0)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 14.0))

;; Theme
(setq doom-theme (if (string= "herwig" user-login-name) 'doom-nord 'doom-molokai))

;; Misc
(setq display-line-numbers-type nil
      evil-echo-state nil                      ; I find it distracting; and I can tell the state from the cursor
      frame-title-format "%b"
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)
