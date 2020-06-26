;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! anki-editor)
(package! auto-latex-snippets
  :recipe (:host github :repo "tecosaur/Auto-LaTeX-Snippets"))
(package! evil-tex :recipe (:host github :repo "itai33/evil-tex") :pin "f199afd926c2f920663e8aeb42c4310e05c90228")
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el") :pin "557da39878d0637395fdded91243b340c37eff7b")
(package! literate-calc-mode)
(package! mixed-pitch)
(package! org-toggl :recipe (:host github :repo "mbork/org-toggl") :pin "40b5353dc58e635ba2e80e3e4471b74941d535cb")

(package! zenburn-emacs
  :recipe (:host github :repo "bbatsov/zenburn-emacs"))
