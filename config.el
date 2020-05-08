;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+org")

;;; Emacs Calc, poor man's Mathematica
(after! calc
  (setq calc-angle-mode 'rad
        calc-algebraic-mode t
        calc-symbolic-mode t)
  (evil-set-initial-state 'calc-mode 'emacs))

;;; Packages
;; Company
(after! company
  (setq company-idle-delay nil))


;; Direnv
(setq direnv-always-show-summary nil)

(after! evil-tex
  (add-hook! latex-mode #'evil-tex-mode))


;; Git
(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))


;; Haskell
(after! haskell
  (setq haskell-interactive-popup-errors nil))


;; Hercules
(use-package! hercules
  :config
  (hercules-def
   :show-funs #'macrostep-expand
   :hide-funs #'macrostep-collapse-all
   :keymap 'macrostep-keymap))


;; Python
(after! python
  (setq python-shell-interpreter "ipython"))


;; Scheme
(after! geiser
  (setq geiser-active-implementations '(mit)
        geiser-default-implementation 'mit))


;; Snippets
(after! yasnippet
  (push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))


;; Which Key
(after! which-key
  (setq which-key-idle-delay 0.5)
  (setq which-key-allow-multiple-replacements t)
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))
