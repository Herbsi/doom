;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! evil-tex :recipe (:host github :repo "itai33/evil-tex") :pin "81e89a9760ae927b28ceb15699d4bf7c8f602a0b")
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el") :pin "557da398")
(package! matlab-mode :recipe (:host github :repo "yuhonglin/matlab-mode") :pin "3ec032e")
(package! org-ql :pin "c847afe0b538a1a44c73e40b067831cbea132ba7")
(package! org-super-agenda :pin "dd0d104")
(package! org-toggl :recipe (:host github :repo "mbork/org-toggl") :pin "40b5353")

;; Themes
(package! zenburn :recipe (:host github :repo "bbatsov/zenburn-emacs") :pin "7dd7968")
