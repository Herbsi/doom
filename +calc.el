;;; +calc.el -*- lexical-binding: t; -*-

(after! calc
  (setq calc-angle-mode 'rad
        calc-algebraic-mode t
        calc-symbolic-mode t
        calc-multiplication-has-precedence nil) ; so that a/b*c == (a/b)*c
  (evil-set-initial-state 'calc-mode 'emacs))
