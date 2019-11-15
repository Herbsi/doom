;;; .doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 (:map org-mode-map
   :localleader
   "e" nil
   :localleader
   "i" nil)

 (:after racket-mode
   (:map racket-mode-map
     (:when (featurep! :editor lispy)
       :i "[" nil))))

(map!
 :leader ;; SPC
 (:prefix ("b" . "buffer")
   :desc "ibuffer" "i" #'ibuffer)

 (:prefix ("B" . "bookmarks")
   :desc "List Bookmarks" "l" #'bookmark-bmenu-list
   :desc "Set Bookmark" "s" #'bookmark-set)

 (:prefix ( "c" . "code")
   (:prefix ("n" . "narrow")
     :desc "Current Function" "f" #'narrow-to-defun
     :desc "Widen" "w" #'widen))

 (:prefix ("f" . "file")
   :desc "Write all files" "a" #'evil-write-all
   :desc "Find File other window" "o" #'find-file-other-window)

 (:prefix ("n" . "notes")
   :desc "Org Journal" "j" #'org-journal-new-entry)

 ;; window management (prefix "C-w")
 (:map evil-window-map
   "d"   #'delete-window
   "C-d" #'delete-window)

 ;; Org Mode
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
     :desc "org-insert-subheading" "s" #'org-insert-subheading))

 ;; Racket Major Mode
 (:after racket-mode
   (:map racket-mode-map
     :desc "racket-eval-last-sexp" "C-x C-e" #'racket-eval-last-sexp
     (:when (featurep! :editor lispy)
       :i "[" #'lispyville-previous-opening)))

 ;; Rust Major Mode
 (:after rust-mode
   (:map rust-mode-map
     :localleader
     :prefix "b"
     :desc "cargo clippy" "C" (λ! (+rust-cargo-compile "cargo clippy --color always")))))
