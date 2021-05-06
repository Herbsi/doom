;;; +spell.el -*- lexical-binding: t; -*-

(after! ispell
  (setq ispell-dictionary "en_US,de_AT"
        ispell-personal-dictionary (expand-file-name "aspell/personal.pws" (getenv "XDG_CONFIG_HOME")))
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,de_AT"))
