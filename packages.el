;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! anki-editor)
(package! auto-latex-snippets
  :recipe (:host github :repo "tecosaur/Auto-LaTeX-Snippets"))
(package! evil-tex :recipe (:host github :repo "itai33/evil-tex") :pin "81e89a9760ae927b28ceb15699d4bf7c8f602a0b")
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el") :pin "557da39878d0637395fdded91243b340c37eff7b")
(package! literate-calc-mode)
(package! mixed-pitch)
(package! doct :pin "1bcec209e12200c9b93b0d95f61b964b5de4439c")
(package! org-ql :recipe (:host github :repo "alphapapa/org-ql") :pin "c847afe0b538a1a44c73e40b067831cbea132ba7")
(package! org-super-agenda :pin "dd0d104c269fab9ebe5af7009bc1dd2a3a8f3c12")
(package! org-toggl :recipe (:host github :repo "mbork/org-toggl") :pin "40b5353dc58e635ba2e80e3e4471b74941d535cb")

;; Needed for org-gcal
(package! org-gcal :pin "2ee2b31547e6f4e33db70fb812d552e55d612fd6")
(package! alert)
(package! persist)
(package! request :pin "912525c772984c6af0fd84acd6699ee43d91037a")
