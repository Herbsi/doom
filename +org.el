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

;; Anki
(use-package anki-editor
  :after org
  :init
  (setq-default anki-editor-use-math-jax t))

;; Deft
(setq deft-directory (expand-file-name "References/Notes" (getenv "HOME"))
      deft-new-file-format "1%Y%m%d"
      deft-use-filename-as-title t)

;; org-crypt
(after! org
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt"))
        org-crypt-key "F1653669C24076F7"))
;; org-journal
(after! org-journal
  (setq org-journal-dir (expand-file-name "Cerebro/Journal" (getenv "HOME"))
        org-journal-file-type 'monthly
        org-journal-file-format "1%Y/%m %B.org" ;; e.g. 12021/01 January.org
        org-journal-date-format "1%Y-%m-%d"
        org-journal-time-format "** "))

