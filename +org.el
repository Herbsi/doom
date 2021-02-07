;;; +org.el -*- lexical-binding: t; -*-

;; General
;; Set defaults
(setq
 org-directory (expand-file-name "Org" (getenv "HOME"))
 org-archive-location (expand-file-name ".archive/%s::" org-directory)
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
 org-catch-invisible-edits 'smart
 org-export-in-background t
 org-list-allow-alphabetical t)

(add-hook! org-mode #'mixed-pitch-mode)

;; Export to LaTeX
;; Use latexm instead of pdflatex
(setq org-latex-pdf-process '("latexmk -%latex -shell-escape -interaction=nonstopmode -f -pdf -output-directory=%o %f"))

;; Anki
(use-package anki-editor
  :after org
  :init
  (setq-default anki-editor-use-math-jax t))

;; org-crypt
(after! org
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt"))
        org-crypt-key "F1653669C24076F7"))
