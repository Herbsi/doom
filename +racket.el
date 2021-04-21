;;; +racket.el -*- lexical-binding: t; -*-

;; Fix Inserting “[]” in racket-mode with lispy
(map!
 :mode racket-mode
 :map lispy-mode-map
 ;; simulate smartparens
 :i "[" (cmd! (insert-char #x005B) (insert-char #x005D) (backward-char))
 :i "]" (cmd! (insert-char #x005D)))
