;;; +languages.el -*- lexical-binding: t; -*-

;; Haskell
(after! haskell
  (setq haskell-interactive-popup-errors nil))

;; Python
(after! python
  (setq python-shell-interpreter "ipython"))

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
