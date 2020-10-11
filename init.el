;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-

(doom!
 :input
 ;; chinese
 ;; japanese

 :completion
 (company +childframe)
 ;; helm
 ;; ido
 (ivy
  +childframe
  +prescient
  +fuzzy)

 :ui
 deft
 doom
 ;; doom-dashboard
 ;; doom-quit
 ;; fill-column
 hl-todo
 ;; hydra
 ;; indent-guides
 ;; minimap
 (modeline +light)
 nav-flash
 ;; neotree
 ophints
 (popup
  ;; +all
  +defaults)
 ;; (ligatures +extra)
 ;; tabs
 treemacs
 ;; unicode
 vc-gutter
 ;; vi-tilde-fringe
 (window-select +numbers)
 ;; workspaces
 ;; zen

 :editor
 (evil +everywhere)
 file-templates
 fold
 (format +onsave)
 ;; god
 lispy
 multiple-cursors
 ;; objed
 ;; parinfer
 ;; rotate-text
 snippets
 ;; word-wrap

 :emacs
 ;; (dired +ranger)
 ;; electric
 ;; ibuffer
 (undo +tree)
 vc

 :term
 eshell
 ;; shell
 ;; term
 ;; vterm

 :checkers
 syntax
 ;; (spell +aspell)
 ;; grammar

 :tools
 ;; ansible
 ;; biblio
 ;; debugger
 direnv
 ;; docker
 editorconfig
 ;; ein
 (eval +overlay)
 ;; gist
 ;; (lookup +dictionary +docsets)
 lsp
 magit
 ;; make
 ;; pass
 ;; pdf
 ;; prodigy
 ;; rgb
 ;; taskrunner
 ;; terraform
 ;; tmux
 ;; upload

 :os
 macos
 ;; tty

 :lang
 ;; agda
 (cc +lsp)
 ;; clojure
 common-lisp
 ;; coq
 ;; crystal
 ;; csharp
 data
 ;; (dart +flutter)
 ;; elixir
 ;; elm
 emacs-lisp
 ;; erlang
 ess
 ;; faust
 ;; fsharp
 ;; fstar
 ;; go
 (haskell +dante)
 ;; hy
 ;; idris
 ;; (java +meghanada)
 ;; javascript
 ;; json
 ;; julia
 ;; kotlin
 (latex +fold +latexmk)
 ;; lean
 ;; ledger
 ;; lua
 markdown
 ;; nim
 ;; nix
 ;; ocaml
 (org +dragndrop +roam)
 ;; perl
 ;; php
 ;; plantuml
 ;; purescript
 (python +lsp)
 ;; qt
 racket
 ;; rest
 ;; rst
 ;; ruby
 (rust +lsp)
 ;; scala
 scheme
 (sh +fish)
 ;; sml
 ;; solidity
 ;; swift
 ;; terra
 ;; web
 ;; yaml

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
 (default +bindings +smartparens))
