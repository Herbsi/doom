;;; +scheme.el -*- lexical-binding: t; -*-

(after! geiser
  (setq geiser-active-implementations '(racket mit)
        geiser-default-implementation 'mit
        geiser-repl-history-filename (expand-file-name "geiser/history"
                                                       (getenv "XDG_DATA_HOME"))))
