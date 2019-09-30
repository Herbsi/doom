;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(add-hook! org-mode (lambda ()
                      "Beautify Org Checkbox Symbol"
                      (push '("[ ]" . "☐") prettify-symbols-alist)
                      (push '("[X]" . "☑" ) prettify-symbols-alist)
                      (push '("[-]" . "❍" ) prettify-symbols-alist)
                      (prettify-symbols-mode)))

(defun setup-university-tasks ()
  (interactive)
  (let* ((tomorrow (time-add (current-time) (* 24 3600))))
    (progn
      (goto-char (point-max))
      (org-insert-heading)
      (org-insert-time-stamp tomorrow nil nil " " " [/]" nil)
      (newline)
      (insert "- [ ] ")
      (evil-append 1))))

;; Org Journal
(use-package! org-journal
  :config
  (setq org-journal-dir "~/Private/Journal/"
        org-journal-file-format "%Y/%m %B.org" ;; e.g. 2019/04 April.org
        org-journal-encrypt-journal t
        org-journal-file-type 'monthly
        org-journal-date-prefix "* "
        org-journal-date-format "%F %a" ;; e.g. 2019-04-01 Fri
        ;; see here for formatting symbols: https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
        org-journal-time-prefix "** "
        org-journal-time-format "")
  (defun setup-entry ()
    (progn
      (doom/window-maximize-buffer)
      (evil-scroll-line-to-top (line-number-at-pos))
      (evil-scroll-line-up 2)))
  (add-hook! org-journal-after-entry-create #'setup-entry)
  (map!
   :leader
   (:prefix ("n" . "notes")
     :desc "Org Journal"      "j" #'org-journal-new-entry)))

;; unset some default bindings
(map!
 :map org-mode-map
 :localleader
 "i" nil)

;; bind and rebind stuff
(map!
 :map org-mode-map
 :localleader
 (:prefix ("c" . "clock")
   :desc "Report" "r" #'org-clock-report)

 (:prefix ("C" . "checkbox")
   :desc "org-toggle-checkbox" "t" #'org-toggle-checkbox
   :desc "org-update-checkbox-count" "u" #'org-update-checkbox-count)

 (:prefix ("e" . "export")
   :desc "org-export-dispatch" "d" #'org-export-dispatch)

 (:prefix ("i" . "insert")
   :desc "org-timestamp" "t" #'org-time-stamp
   :desc "org-insert-heading-after-current" "h" #'org-insert-heading-after-current
   :desc "org-insert-heading" "H" #'org-insert-heading
   :desc "org-insert-subheading" "s" #'org-insert-subheading))
