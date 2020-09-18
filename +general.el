;;; +general.el -*- lexical-binding: t; -*-

;; Personal Information
(setq user-full-name "Herwig"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to "9C167EE7C9D3CA5D8C35807A1DCF474EE53A950D")

(setq auth-sources '("~/.secrets/authinfo.gpg")
      auth-source-cache-expiry nil)

;; Better Defaults
(setq-default
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq sentence-end-double-space t                 ; the only correct choice
      auto-save-default t
      confirm-kill-emacs nil                      ; Don't ask me if I want to quit
      default-input-method "german-postfix"       ; for when I need to type ä, ö, ü or ß
      evil-want-fine-undo t                       ; the finer the undo, the better
      inhibit-compacting-font-caches t            ; when there are a lot of glyphs, keep them in memory
      undo-limit 80000000                         ; the more the undo, the better
      +evil-want-o/O-to-continue-comments nil)

(delete-selection-mode 1)                         ; Replace selection when inserting text
(global-subword-mode 1)                           ; Iterate through CamelCase words
(global-hl-line-mode 1)                           ; Highlight cursor line

;; Save auto-customisations in separate file
(setq-default custom-file (expand-file-name ".custom.el" doom-private-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; Git
(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))

;; Magit-Delta
(use-package! magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode))

;; Split windows to the right and bottom
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Pull up ivy after window split
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

;; Use hard line wrap
(remove-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)

;; Allow nested snippet expansion
(after! yasnippet
  (setq yas-triggers-in-field t))

;; Unbind keys for typing German Umlaute
(map!
 :i "M-u a" (cmd! (insert-char #x00E4))
 :i "M-u o" (cmd! (insert-char #x00F6))
 :i "M-u u" (cmd! (insert-char #x00FC))
 :i "M-u A" (cmd! (insert-char #x00C4))
 :i "M-u O" (cmd! (insert-char #x00D6))
 :i "M-u U" (cmd! (insert-char #x00DC))
 :i "M-s" (cmd! (insert-char #x00DF)))

;; Typographic Keybindings
(map!
 :i "M-]" (cmd! (insert-char #x2018))
 :i "M-}" (cmd! (insert-char #x2019))
 :i "M-[" (cmd! (insert-char #x201C))
 :i "M-{" (cmd! (insert-char #x201D)))
