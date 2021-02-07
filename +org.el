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

(after! org
  (setq org-hide-emphasis-markers t     ; hide org markup syntax
        org-insert-heading-respect-content nil ; insert heading at point, not after current subtree
        org-capture-templates
        '(("n" "Note" plain #'+default/find-in-notes)
          ("r" "Roam" plain #'org-roam-capture ""))))

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

;; org-id
(after! org-id
  ;; Do not create ID if a CUSTOM_ID exists
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))

;; org-journal
(after! org-journal
  (setq org-journal-dir (expand-file-name "Cerebro/Journal" (getenv "HOME"))
        org-journal-file-type 'monthly
        org-journal-file-format "1%Y/%m %B.org" ;; e.g. 12021/01 January.org
        org-journal-date-format "1%Y-%m-%d"
        org-journal-time-format "** "))

;; org-roam
(setq org-roam-directory (file-truename (expand-file-name "Cerebro" (getenv "HOME")))
      org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory)
      org-roam-file-exclude-regexp "Journal/.*"
      org-roam-capture-templates '(("t" "thought" plain #'org-roam-capture--get-point "%?"
                                   :file-name "1%<%Y%m%d%H%M%S>-T ${title}"
                                    :head "#+title: ${title}\n\n"
                                    :unarrowed t)
                                   ("n" "note" plain #'org-roam-capture--get-point "%?"
                                    :file-name "1%<%Y%m%d%H%M%S>-N ${title}"
                                    :head "#+title: ${title}\n\n"
                                    :unarrowed t))
      org-roam-capture-ref-templates '(("r" "ref" plain #'org-roam-capture--get-point "%?"
                                        :file-name "1%<%Y%m%d%H%M%S>-R ${title}"
                                        :head "#+title: ${title}\n#+roam_key: ${ref}n\n"
                                        :unarrowed t)))

;; org-roam-server
(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))
