;;; +org.el -*- lexical-binding: t; -*-

;; General
;; Set defaults
(setq
 org-directory (expand-file-name "Notes" (getenv "HOME"))
 org-archive-location (expand-file-name ".archive/%s::" org-directory)
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
 org-catch-invisible-edits 'smart
 org-export-in-background t
 org-list-allow-alphabetical t)

(after! org
  (setq org-hide-emphasis-markers t     ; hide org markup syntax
        org-insert-heading-respect-content nil ; insert heading at point, not after current subtree
        org-cycle-separator-lines 0 ; don’t leave empty lines between subtrees in collapsed view
        org-capture-templates
        '(("r" "Roam" plain #'org-roam-capture "")
          ("w" "Working Memory" entry
           (file "~/Desktop/Working Memory.org")
           "* %T %?")))
  (add-hook 'org-capture-prepare-finalize-hook #'org-id-store-link))

(add-hook! org-mode #'mixed-pitch-mode)
(add-hook! org-mode #'(turn-off-smartparens-mode electric-pair-mode))

;;; org-id
(after! org-id
  ;; Do not create ID if a CUSTOM_ID exists
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))


(load! "+org-roam.el")
