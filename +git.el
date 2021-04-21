;;; +git.el -*- lexical-binding: t; -*-

(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))


;; Magit-Delta
(use-package! magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode))
