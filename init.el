;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-localleader-key ",")

(doom!
 :input
 ;; chinese
 ;; japanese

 :completion
 (company
  +childframe)
 ;; helm
 ;; ido
 (ivy
  +prescient
  +icons
  ;; +childframe
  +fuzzy)

 :ui
 ;; deft
 doom
 doom-dashboard
 doom-quit
 fill-column
 hl-todo
 ;; hydra
 ;; indent-guides
 (modeline
  +light)
 nav-flash
 ;; neotree
 ophints
 (popup
  +all
  +defaults)
 ;; (pretty-code
 ;;  +fira)
 ;; tabs
 treemacs
 unicode
 vc-gutter
 vi-tilde-fringe
 window-select
 workspaces
 zen

 :editor
 (evil +everywhere)
 file-templates
 ;; fold
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
 (dired
  +icons)
 electric
 ibuffer
 vc

 :term
 ;; eshell
 ;; shell
 ;; term
 vterm

 :tools
 ;; ansible
 ;; debugger
 ;; direnv
 ;; docker
 editorconfig
 ;; ein
 (eval +overlay)
 flycheck
 flyspell
 ;; gist
 (lookup
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
 (cc
  +lsp)
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
 ;; (haskell +lsp)
 ;; hy
 ;; idris             ;
 ;; (java +meghanada)
 ;; javascript
 ;; julia
 ;; kotlin
 latex
 ;; ledger
 ;; lua
 ;; markdown
 ;; nim
 ;; nix
 ;; ocaml
 (org
  +dragndrop
  +ipython
  +journal)
 ;; perl
 ;; php
 ;; plantuml
 ;; purescript
 python
 ;; qt
 ;; racket
 ;; rest
 ;; ruby
 (rust +lsp)
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
 ;; (write
 ;; +wordnut
 ;; +langtool)

 :config
 ;; For literate config users. This will tangle+compile a config.org
 ;; literate config in your `doom-private-dir' whenever it changes.
 ;; literate

 ;; The default module sets reasonable defaults for Emacs. It also
 ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
 ;; config. Use it as a reference for your own modules.
 (default +bindings)

 :private)
