;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(put 'narrow-to-region 'disabled nil)

(doom!
 :input
 ;; chinese
 ;; japanese

 :completion
 (company
  ;; +childframe
  )
 ;; helm
 ;; ido
 (ivy
  ;; +prescient
  ;; +fuzzy
  ;; +childframe
  ;; +icons
  )

 :ui
 ;; deft
 doom
 ;; doom-dashboard
 doom-quit
 ;; fill-column
 hl-todo
 ;; hydra
 ;; indent-guides
 (modeline +light)
 nav-flash
 ;; neotree
 ;; ophints
 (popup
  ;; +all
  +defaults)
 ;; (pretty-code
 ;;  +fira)
 ;; tabs
 treemacs
 ;; unicode
 vc-gutter
 vi-tilde-fringe
 window-select
 workspaces
 ;; zen

 :editor
 (evil +everywhere)
 file-templates
 fold
 format
 ;; god
 lispy
 multiple-cursors
 ;; objed
 ;; parinfer
 ;; rotate-text
 snippets
 ;; word-wrap

 :emacs
 (dired
  +ranger
  +icons)
 electric
 ibuffer
 vc

 :term
 ;; eshell
 ;; shell
 ;; term
 vterm

 :checkers
 syntax
 (spell +aspell)
 ;; grammar

 :tools
 ;; ansible
 ;; debugger
 direnv
 ;; docker
 editorconfig
 ;; ein
 (eval +overlay)
 ;; gist
 (lookup
  +dictionary
  +docsets)
 lsp
 macos
 magit
 ;; make
 ;; pass
 pdf
 ;; prodigy
 ;; rgb
 ;; terraform
 ;; tmux
 ;; upload

 :lang
 ;; agda
 ;; assembly
 (cc +lsp)
 ;; clojure
 common-lisp
 ;; coq
 ;; crystal
 ;; csharp
 data
 ;; elixir
 ;; elm
 emacs-lisp
 ;; erlang
 ;; ess
 ;; faust
 ;; fsharp
 ;; go
 ;; (haskell +dante)
 ;; hy
 ;; idris             ;
 ;; (java +meghanada)
 ;; javascript
 ;; julia
 ;; kotlin
 (latex +cdlatex)
 ;; ledger
 ;; lua
 ;; markdown
 ;; nim
 ;; nix
 ;; ocaml
 (org
  +dragndrop
  +journal)
 perl
 ;; php
 ;; plantuml
 ;; purescript
 (python +lsp)
 ;; qt
 ;; racket
 ;; rest
 ;; ruby
 ;; (rust +lsp)
 ;; scala
 scheme
 (sh +fish)
 ;; solidity
 ;; swift
 ;; terra
 ;; web

 :email
 ;; (mu4e +gmail)
 ;; notmuch
 ;; (wanderlust +gmail)

 :app
 ;; calendar
 ;; irc
 ;; (rss +org)
 ;; twitter

 :config
 ;; literate
 (default +bindings +smartparens)

 :private)
