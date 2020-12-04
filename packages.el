;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! anki-editor)
(package! auto-activating-snippets
  :recipe (:host github :repo "ymarco/auto-activating-snippets"))
(package! auto-latex-snippets
  :recipe (:host github :repo "tecosaur/LaTeX-auto-activating-snippets"))
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el") :pin "557da39878d0637395fdded91243b340c37eff7b")
(package! literate-calc-mode)
(package! magit-delta :pin "d988abd99882c6b89f21f2746f721a4d7ece6ad4")
(package! mixed-pitch)
(package! md-roam :recipe (:host github :repo "nobiot/md-roam" :branch "main"))
