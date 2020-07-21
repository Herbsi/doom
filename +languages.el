;;; +languages.el -*- lexical-binding: t; -*-

;; Haskell
(after! haskell
  (setq haskell-interactive-popup-errors nil))

;; Python
(after! python
  (setq python-shell-interpreter "ipython"))

;; Rust
(setq rustic-lsp-server 'rust-analyzer)

;; Scheme
(after! geiser
  (setq geiser-active-implementations '(mit)
        geiser-default-implementation 'mit))
