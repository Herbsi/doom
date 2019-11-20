;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-localleader-key ",")

(doom!
 :input
 ;;chinese
 ;;japanese

 :completion
 (company
  +childframe)
 ;;helm
 ;;ido
 (ivy
  +childframe
  +fuzzy)

 :ui
 ;;deft
 doom
 doom-dashboard
 doom-quit
 ;;fill-column
 hl-todo
 hydra
 ;; ;; indent-guides
 modeline
 nav-flash
 ;; ;;neotree
 ophints
 ;; (popup
 ;;  +all
 ;;  +defaults)
 (pretty-code
  +fira)
 ;; ;;tabs
 treemacs
 unicode
 vc-gutter
 vi-tilde-fringe
 window-select
 workspaces

 :editor
 (evil +everywhere)
 file-templates
 ;; fold
 (format +onsave)
 lispy
 multiple-cursors
 ;;objed
 ;;parinfer
 rotate-text
 snippets
 ;;word-wrap

 :emacs
 (dired
  +icons)
 electric
 vc

 :term
 eshell
 ;;shell
 ;;term
 ;;vterm

 :tools
 ;;ansible
 debugger
 ;;direnv
 ;;docker
 editorconfig
 ;;ein
 eval
 flycheck
 flyspell
 ;;gist
 (lookup
  +docsets)
 lsp
 macos
 magit
 ;;make
 ;;password-store
 ;;pdf
 ;;prodigy
 ;;rgb
 ;;terraform
 ;;tmux
 ;;upload
 ;;wakatime

 :lang
 ;;agda
 ;;assembly
 (cc
  +lsp)
 ;;clojure
 common-lisp
 ;;coq
 ;;crystal
 ;;csharp
 data
 ;;erlang
 ;;elixir
 ;;elm
 emacs-lisp
 ;;ess
 ;;fsharp
 ;;go
 (haskell +lsp)
 ;;hy
 ;;idris             ;
 ;;(java +meghanada)
 ;;javascript
 ;;julia
 ;;kotlin
 latex
 ;;ledger
 ;;lua
 ;;markdown
 ;;nim
 ;;nix
 ;;ocaml
 (org
  +dragndrop
  +ipython)
 ;;perl
 ;;php
 ;;plantuml
 ;;purescript
 python
 ;;qt
 racket
 ;;rest
 ;;ruby
 (rust +lsp)
 ;;scala
 ;;scheme
 (sh +fish)
 ;;solidity
 ;;swift
 ;;terra
 ;;web
 ;;vala

 :email
 ;;(mu4e +gmail)
 ;;notmuch
 ;;(wanderlust +gmail)

 ;; Applications are complex and opinionated modules that transform Emacs
 ;; toward a specific purpose. They may have additional dependencies and
 ;; should be loaded late.
 :app
 ;;calendar
 ;;irc
 ;;(rss +org)
 ;;twitter
 ;;(write
 ;; +wordnut
 ;; +langtool)

 :config
 ;; For literate config users. This will tangle+compile a config.org
 ;; literate config in your `doom-private-dir' whenever it changes.
 ;;literate

 ;; The default module sets reasonable defaults for Emacs. It also
 ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
 ;; config. Use it as a reference for your own modules.
 (default +bindings +evil-commands)

 :private)
