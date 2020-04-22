;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

(package! annalist)
(package! calctex :recipe (:host github :repo "johnbcoughlin/calctex"
                                 :files ("*.el")))
(package! company-tabnine ; tab9 autocomplete
  :recipe (:host github :repo "TommyX12/company-tabnine"
           :files ("company-tabnine.el" "fetch-binaries.sh")))
(package! evil-tex :recipe (:host github :repo "itai33/evil-tex"))
(package! hercules :recipe (:host gitlab :repo "jjzmajic/hercules.el"))
(package! imenu-list)
(package! org-toggl :recipe (:host github :repo "mbork/org-toggl"))

;; Themes
(package! gruber-darker :recipe (:host github :repo "rexim/gruber-darker-theme"))
(package! zenburn :recipe (:host github :repo "bbatsov/zenburn-emacs"))
