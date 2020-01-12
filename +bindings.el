;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(map!
 (:leader
   "SPC" nil
   ":" nil)

 (:after racket-mode
   (:map racket-mode-map
     (:when (featurep! :editor lispy)
       :i "[" nil))))

(map!
 :leader ;; SPC
 :desc "M-x" "SPC" #'counsel-M-x
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

 ;; Racket Mode
 (:after racket-mode
   (:map racket-mode-map
     :desc "racket-eval-last-sexp" "C-x C-e" #'racket-eval-last-sexp
     (:when (featurep! :editor lispy)
       :i "[" #'lispyville-previous-opening)))

 ;; Rust Mode
 (:after rust-mode
   (:map rust-mode-map
     :localleader
     :prefix "b"
     :desc "cargo clippy" "C" (λ! (+rust-cargo-compile "cargo clippy --color always")))))
