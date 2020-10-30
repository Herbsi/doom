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

;; org-crypt
(after! org
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt"))
        org-crypt-key "F1653669C24076F7"))


;; org-roam
(setq org-roam-directory (expand-file-name "Cerebro" org-directory))
(after! org-roam
  (setq org-roam-file-extensions '("md" "org")
        org-roam-title-sources '((mdtitle title mdheadline headline) (mdalias alias))
        org-roam-tag-sources '(prop md-frontmatter)
        org-roam-auto-replace-fuzzy-links nil
        org-roam-capture-templates '(("d" "default" plain #'org-roam-capture--get-point "%?"
                                      :file-name "${title}"
                                      :head "---\ntitle: ${title}\n---\n"
                                      :unarrowed t))
        org-roam-capture-ref-templates '(("r" "ref" plain #'org-roam-capture--get-point "%?"
                                          :file-name "${title}"
                                          :head "---\ntitle: ${title}\nroam_key: ${ref}\n---\n"
                                          :unarrowed t))))

(use-package! md-roam ; load immediately, before org-roam
  :config
  (setq md-roam-file-extension-single "md"
        md-roam-use-org-extract-ref nil
        ;; md-roam-use-org-file-links nil
        md-roam-verbose nil))
