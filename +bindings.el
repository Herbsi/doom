;;; .doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 ;; window management (prefix "C-w")
 (:map evil-window-map
   "d"   #'delete-window
   "C-d" #'delete-window)

 ;; Rust Major Mode
 (:map rust-mode-map
   :localleader
   :prefix "b"
   :desc "cargo clippy" "C" (λ! (+rust-cargo-compile "cargo clippy --color always")))

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
   :desc "Find File other window" "o" #'find-file-other-window))
