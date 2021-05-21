;;; +latex.el -*- lexical-binding: t; -*-

(setq TeX-save-query nil                ; don’t ask, just save
      TeX-command-extra-options "-shell-escape"
      font-latex-fontify-script nil     ; Don’t raise/lower sup-/subscripts
      preview-auto-cache-preamble t     ; Don’t ask, just cache
      +latex-viewers '(skim))
(setq-default TeX-engine 'xetex)

;; All hail mixed-pitch-mode
(add-hook! LaTeX-mode #'mixed-pitch-mode)

;; Some useful Keybinings
(after! tex
  (map!
   :map LaTeX-mode-map
   :ei [C-return] #'LaTeX-insert-item)
  ;; Allows to use $ to enter \( \) math mode
  ;; Needs the closing string because I disable smartparens in LaTeX Mode
  (setq TeX-electric-math '("\\(" . "")))

;;; Auto Activating Snippets
(use-package aas
  :hook ((LaTeX-mode org-mode) . ass-activate-for-major-mode))


;;; LaTeX AAS
(use-package! laas
  :hook ((LaTeX-mode org-mode) . laas-mode)
  :config
  (setq laas-enable-auto-space nil)
  (aas-set-snippets 'laas-mode
                    :cond #'texmathp
                    "mn1" "_{m-1}"
                    "mp1" "_{m+1}"
                    :cond #'laas-auto-script-condition
                    "mm" #'laas-insert-script))


;;; Prettier TeX Fold
(setq TeX-fold-math-spec-list
      `(;; missing/better symbols
        ("≤" ("le"))
        ("≥" ("ge"))
        ("≠" ("ne"))
        ("∇") ("nabla")
        ;; private macros
        ("ℝ" ("RR"))
        ("ℕ" ("NN"))
        ("ℤ" ("ZZ"))
        ("ℚ" ("QQ"))
        ("ℂ" ("CC"))
        ("ℙ" ("PP"))
        ("ℍ" ("HH"))
        ("𝔼" ("EE"))
        ("𝑑" ("dd"))
        ;; known commands
        ("" ("phantom"))
        ;; private commands
        ("|{1}|" ("abs"))
        ("‖{1}‖" ("norm"))
        ("❬{1}, {2}❭" ("anb")) ; explititly using narrower unicode angle brackets
        ("⌊{1}⌋" ("floor"))
        ("⌈{1}⌉" ("ceil"))
        ("⌊{1}⌉" ("round"))
        ;; fancification
        )
      TeX-fold-macro-spec-list
      '(
        ("[f]" ("footnote" "marginpar"))
        ("[c]" ("cite"))
        ("[l]" ("label"))
        ("[r]" ("ref" "pageref" "eqref"))
        ("[i]" ("index" "glossary"))
        ("..." ("dots"))
        ("©" ("copyright"))
        ("®" ("textregistered"))
        ("™"  ("texttrademark"))
        ("[1]:||►" ("item"))))


;;; Flashcard Utility Functions
(setq herwig/proof-lv nil)
(defun herwig/setup-flashcards ()
  "Sets up current buffer for writing math flashcards."
  (interactive)
  (progn
    (find-file "~/University/flashcards.tex")
    (anki-editor-mode)))


(defun herwig/push-cards ()
  "Pushes the cards out of LaTeX-Mode"
  (interactive)
  (progn
    (org-mode)
    (anki-editor-push-notes)
    (LaTeX-mode)))

