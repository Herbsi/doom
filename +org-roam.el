;;; +org-roam.el -*- lexical-binding: t; -*-

(setq org-roam-directory (file-truename (expand-file-name "Cerebro" (getenv "HOME")))
      org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory)
      org-roam-file-exclude-regexp "Journal/.*"
      org-roam-capture-templates '(("t" "thought" plain #'org-roam-capture--get-point "%?"
                                    :file-name "Personal/1%<%Y%m%d%H%M%S>-T ${title}"
                                    :head "#+TITLE: ${title}\n\n"
                                    :unarrowed t)
                                   ("n" "note" plain #'org-roam-capture--get-point "%?"
                                    :file-name "Personal/1%<%Y%m%d%H%M%S>-N ${title}"
                                    :head "#+TITLE: ${title}\n\n"
                                    :unarrowed t)
                                   ("T" "math thought" plain #'org-roam-capture--get-point "%?"
                                    :file-name "Mathematics/1%<%Y%m%d%H%M%S>-T ${title}"
                                    :head "#+TITLE: ${title}\n\n"
                                    :unarrowed t)
                                   ("N" "math note" plain #'org-roam-capture--get-point "%?"
                                    :file-name "Mathematics/1%<%Y%m%d%H%M%S>-N ${title}"
                                    :head "#+TITLE: ${title}\n\n"
                                    :unarrowed t))
      org-roam-capture-ref-templates '(("r" "ref" plain #'org-roam-capture--get-point "%?"
                                        :file-name "Personal/1%<%Y%m%d%H%M%S>-R ${title}"
                                        :head "#+TITLE: ${title}\n#+roam_key: ${ref}n\n"
                                        :unarrowed t)
                                       ("R" "math ref" plain #'org-roam-capture--get-point "%?"
                                        :file-name "Mathematics/1%<%Y%m%d%H%M%S>-R ${title}"
                                        :head "#+TITLE: ${title}\n#+roam_key: ${ref}n\n"
                                        :unarrowed t)))

(after! org-roam
  (add-to-list 'org-roam-tag-sources 'first-directory))


;;; org-roam-server
(use-package org-roam-server
  :after org-roam
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
