;;; +bindings.el -*- lexical-binding: t; -*-

;; Move up and down visual lines, not logical
(map!
 :n [remap evil-next-line] #'evil-next-visual-line
 :n [remap evil-previous-line] #'evil-previous-visual-line
 :v [remap evil-next-line] #'evil-next-visual-line
 :v [remap evil-previous-line] #'evil-previous-visual-line)

;; Make horizontal movement cross lines
(setq-default evil-cross-lines t)
