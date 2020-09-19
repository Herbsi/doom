;;; +bindings.el -*- lexical-binding: t; -*-

(defmacro ubind! (&rest rest)
 "Convenience macro for easily binding unicode characters

Example:

(ubind! (\"M-u a\" #x00E4 \"ä\")
        (\"M-u o\" #x00F6) =>
(map!
  :desc \"ä\" :ri \"M-u a\" (cmd! (insert-char #x00E4)))
  :ri \"M-u o\" (cmd! (insert-char #x00F6))) "
  `(map!
    ,@(mapcar (lambda (el)
                `(,@(when (cddr el) `(:desc ,(caddr el)))
                  :ir
                  ,(car el)
                  (cmd! (insert-char ,(cadr el)))))
              rest)))

;; German Umlaute
(ubind!
 ("M-u a" #x00E4 "ä")
 ("M-u o" #x00F6 "ö")
 ("M-u u" #x00FC "ü")
 ("M-u A" #x00C4 "Ä")
 ("M-u O" #x00D6 "Ö")
 ("M-u U" #x00DC "Ü")
 ("M-s" #x00DF "ß"))

;; Typographic Keybindings
(ubind!
 ("M-]" #x2018 "‘")
 ("M-}" #x2019 "’")
 ("M-[" #x201C "“")
 ("M-{" #x201D "”"))
