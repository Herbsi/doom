;;; +which-key.el -*- lexical-binding: t; -*-

(after! which-key
  (setq which-key-idle-delay 0.5)
  (setq which-key-allow-multiple-replacements t)
  ;; make evil prefixes in which-key more compact
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))
