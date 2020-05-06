;;; ~/.config/doom/+org.el -*- lexical-binding: t; -*-

(setq
 org-ellipsis " ▼ "
 org-directory (expand-file-name "Org" (getenv "HOME"))
 org-archive-location (concat org-directory ".archive/%s::")
 org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷")
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

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
      org-agenda-start-day "-1d"
      org-stuck-projects '("+LEVEL=3/-[X]"
                      ("[?]")
                      nil "")
      org-refile-targets '((nil :maxlevel . 7) (org-agenda-files :maxlevel . 7))
      org-agenda-show-future-repeats 'next
      org-capture-templates
      '(("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
         "** TODO %?\n %i\n %a")
        ("n" "Note" plain (function org-roam-capture)
         "%?"))
      org-agenda-custom-commands
      '(("p" . "Personal")
        ("pa" "All"
         ((org-ql-block '((category "Personal")))))
        ("pt" "TODO"
         ;; tags-todo "+CATEGORY=\"Personal\"-SCHEDULED>\"<today>\"")
         ((org-ql-block '(and (category "Personal")
                              (or (scheduled :to today)
                                  (not (ts)))))))
        ("u" . "University")
        ("ua" "All"
         ((org-ql-block '((category "University")))))
        ("ut" "TODO"
         ((org-ql-block '(and (category "University")
                              (or (scheduled :to today)
                                  (not (scheduled)
                                       (deadline)))))))
      org-super-agenda-groups
      '((:name "Inactive"
         :todo ("DONE" "KILL" "[X]")
         :order 100)
        (:habit t
         :order 3)
        (:name "Schedule"
         :time-grid t
         :order 1)
        (:name "Overdue"
         :deadline past)
        (:name "Scheduled earlier"
         :scheduled past
         :order)
        (:name "Today"
         :scheduled today
         :order 2)
        (:name "Due Today"
         :deadline today
         :order 2)
        (:name "Due Soon"
         :deadline future
         :order 5)
        (:auto-parent t
         :order 6)))
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
