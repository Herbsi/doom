;;; +languages.el -*- lexical-binding: t; -*-

;; Haskell
(after! haskell
  (setq haskell-interactive-popup-errors nil))

;; Python
(after! python
  (setq python-shell-interpreter "ipython"))

;; Fix Inserting “[]” in racket-mode with lispy
(map!
 :mode racket-mode
 :map lispy-mode-map
 ;; simulate smartparens
 :i "[" (cmd! (insert-char #x005B) (insert-char #x005D) (backward-char))
 :i "]" (cmd! (insert-char #x005D)))

;; Rust
(setq rustic-lsp-server 'rust-analyzer)
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer
        rustic-lsp-client 'eglot))

;; Scheme
(after! geiser
  (setq geiser-active-implementations '(racket mit)
        geiser-default-implementation 'mit
        geiser-repl-history-filename (expand-file-name "geiser/history"
                                                       (getenv "XDG_DATA_HOME"))))
