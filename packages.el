;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! mixed-pitch)
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el") :pin "557da39878d0637395fdded91243b340c37eff7b")
(package! literate-calc-mode)

;; Git
(package! magit-delta :pin "d988abd99882c6b89f21f2746f721a4d7ece6ad4")

;; LaTeX
(package! aas
  :recipe (:host github :repo "ymarco/auto-activating-snippets")
  :pin "dd58b7601ec536980a14540bddac53f5d1c1da08")
(package! laas
  :recipe (:host github :repo "tecosaur/LaTeX-auto-activating-snippets")
  :pin "78b10f0e1629283f8ba0f5bd1e28cf9a606362fd")

;; Org
(package! anki-editor :pin "546774a453ef4617b1bcb0d1626e415c67cc88df")
(package! org-roam-server :pin "a9051e03a2fc3744aa6716ebb529142caa0af2f0")
