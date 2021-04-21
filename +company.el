;;; +company.el -*- lexical-binding: t; -*-

(after! company
  (setq company-idle-delay nil
        company-minimum-prefix-length 1
        company-box-doc-delay 0.1))

(map!
 :i "M-ESC" #'+company/complete)
