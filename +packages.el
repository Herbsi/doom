;;; +packages.el -*- lexical-binding: t; -*-

;; Calc
(after! calc
  (setq calc-angle-mode 'rad
        calc-algebraic-mode t
        calc-symbolic-mode t
        calc-multiplication-has-precedence nil) ; so that a/b*c == (a/b)*c
  (evil-set-initial-state 'calc-mode 'emacs))

;; Company
(after! company
  (setq company-idle-delay nil))

;; Direnv
;; Disable frequent, verbose summary messages
(after! direnv
  (setq direnv-always-show-summary nil))

;; Hercules
(use-package! hercules
  :config
  (hercules-def
   :show-funs #'macrostep-expand
   :hide-funs #'macrostep-collapse-all
   :keymap 'macrostep-keymap))

;; Which Key
;; make evil prefixes in which-key more compact
(after! which-key
  (setq which-key-idle-delay 0.5)
  (setq which-key-allow-multiple-replacements t)
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))
