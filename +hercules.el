;;; +hercules.el -*- lexical-binding: t; -*-

(use-package! hercules
  :defer t
  :config
  (hercules-def
   :show-funs #'macrostep-expand
   :hide-funs #'macrostep-collapse-all
   :keymap 'macrostep-keymap)

  (hercules-def
   :show-funs #'racket-expand-last-sexp
   :hide-funs #'+popup/quit-window
   :keymap 'racket-stepper-mode-map))
