;;; ~/.config/doom/+bindings.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 :leader
 ":" nil
 :desc "M-x" "SPC" #'counsel-M-x

 (:prefix ("b" . "buffer")
   :desc "ibuffer" "i" #'ibuffer)

 (:prefix ( "c" . "code")
   (:prefix ("n" . "narrow")
     :desc "Current Function" "f" #'narrow-to-defun
     :desc "Page" "p" #'narrow-to-page
     :desc "Selected Region" "r" #'narrow-to-region
     :desc "Widen" "w" #'widen))

 (:prefix ("f" . "file")
   :desc "Write all files" "a" #'evil-write-all
   :desc "Find File other window" "o" #'find-file-other-window)

 (:prefix ("n" . "notes")
   :desc "Org Journal" "j" #'org-journal-new-entry)

 ;; Common Lisp
 ;; Racket Mode
 :map racket-mode-map
 :desc "racket-eval-last-sexp" "C-x C-e" #'racket-eval-last-sexp
 (:when (featurep! :editor lispy)
   (:after lispy
     :i "[" #'lispyville-previous-opening))

 ;; Rust
 :map rust-mode-map
 :localleader
 :prefix "b"
 :desc "cargo clippy" "C" (λ! (+rust-cargo-compile "cargo clippy --color always")))
 (:after sly
   :map lisp-mode-map
   :localleader
   :desc "Macrostep" "m" #'macrostep-expand))
