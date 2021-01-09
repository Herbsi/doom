;;; +ui.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Triplicate T4c" :size 13.0)
      doom-variable-pitch-font (font-spec :family "Triplicate T4p" :size 13.0))

;; Change Theme based on macOS System Theme
(add-hook 'ns-system-appearance-change-functions
          (lambda (appearance)
            (pcase appearance
              ('light (load-theme 'doom-nord-light t))
              ('dark (load-theme 'doom-dracula t)))))

;; Misc
(setq display-line-numbers-type nil
      evil-echo-state nil                      ; I find it distracting; and I can tell the state from the cursor
      frame-title-format "%b"
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)
