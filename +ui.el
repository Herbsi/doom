;;; +ui.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Triplicate T4c" :size 14.0)
      doom-variable-pitch-font (font-spec :family "Triplicate T4p" :size 14.0))

;; Theme
(defun set-system-dark-mode ()
  (interactive)
  (if (string-equal "true" (ns-do-applescript "tell application \"System Events\"
	tell appearance preferences
		if (dark mode) then
			return \"true\"
		else
			return \"false\"
		end if
	end tell
end tell"))
      (setq doom-theme 'doom-nord)
    (setq doom-theme 'doom-nord-light)))
(set-system-dark-mode)

;; Misc
(setq display-line-numbers-type nil
      evil-echo-state nil                      ; I find it distracting; and I can tell the state from the cursor
      frame-title-format "%b"
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)
