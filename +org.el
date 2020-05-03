;;; ~/.config/doom/+org.el -*- lexical-binding: t; -*-

(setq
 org-ellipsis " ▼ "
 org-directory (expand-file-name "Org" (getenv "HOME"))
 org-archive-location (concat org-directory ".archive/%s::")
 org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(defun herwig/setup-university-tasks ()
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
(after! org-journal
  (setq org-journal-dir (expand-file-name "Journal" org-directory)
        org-journal-file-format "1%Y/%m %B.org" ;; e.g. 12019/04 April.org
        org-journal-encrypt-journal t
        org-journal-file-type 'monthly
        org-journal-date-prefix "* "
        org-journal-date-format "1%F %a" ;; e.g. 12019-04-01 Fri
        ;; see here for formatting symbols: https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
        org-journal-time-prefix "** "
        org-journal-time-format "")
  (defun herwig/setup-entry ()
    (progn
      (toggl-start-time-entry "Journal" (toggl-get-pid "Solitude") "Journal Timer Started!")
      (doom/window-maximize-buffer)
      (company-mode -1)
      (evil-scroll-line-to-top (line-number-at-pos))
      (evil-scroll-line-up 2)
      (flyspell-mode)))
  (add-hook! org-journal-after-entry-create #'herwig/setup-entry))


;; Org Roam
(after! org-roam
  (setq org-roam-directory (expand-file-name "Cerebro" org-directory)))


;; Org Toggl
(use-package! org-toggl
  :config
  (setq toggl-auth-token "5e48e18d607c8512c580f4dc4d303cc6")
  (setq org-toggl-inherit-toggl-properties t)
  (toggl-get-projects))


;; Org (Super) Agenda
(setq org-agenda-show-future-repeats 'next
      org-stuck-projects '("+LEVEL=3/-DONE"
                      ("TODO" "[ ]" "STRT")
                      nil "")
      org-refile-targets '((nil :maxlevel . 7) (org-agenda-files :maxlevel . 7))
      org-agenda-todo-ignore-with-date t
      org-agenda-show-future-repeats 'next
      org-agenda-custom-commands
      '(("p" "Personal Tasks"
         tags-todo "+Personal")
        ("u" "University Tasks"
         tags-todo "+Uni"))
      org-super-agenda-groups
      '((:log t)
        (:name "Overdue"
         :deadline past)
        (:name "Today"
         :time-grid t
         :scheduled today
         :deadline today)
        (:habit t)
        (:name "Due Soon"
         :deadline future)
        (:name "Scheduled earlier"
         :scheduled past)
        (:name "LVs"
         :tag ("Optimierung_1" "Einfd_Algebra" "Wahrscheinlichkeitstheorie" "Funktionalanalysis"))))
(org-super-agenda-mode)


(after! org
  (map!
   (:map org-mode-map
     :localleader
     "e" nil
     "i" nil))
  (map!
   (:map org-mode-map
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
       :desc "org-insert-subheading" "s" #'org-insert-subheading))))
