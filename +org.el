;;; ~/.config/doom/+org.el -*- lexical-binding: t; -*-
;; Org (Super) Agenda
(setq
      org-agenda-custom-commands
      '(("p" . "Personal")
        ("pa" "All"
         ((org-ql-block '(category "Personal"))))
        ("pt" "TODO"
         ((org-ql-block '(and (category "Personal")
                              (or (scheduled :to today)
                                  (not (ts)))))))
        ("u" . "University")
        ("ua" "All"
         ((org-ql-block '(category "University"))))
        ("ut" "TODO"
         ((org-ql-block '(and (category "University")
                              (or (scheduled :to today)
                                  (not (or (scheduled)
                                           (deadline)))))))))
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
