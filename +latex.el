;;; +latex.el -*- lexical-binding: t; -*-

;; Auto LaTeX Snippets
(use-package! auto-latex-snippets
  :hook (LaTeX-mode . auto-latex-snippets-mode)
  :config
  (add-hook 'als-post-snippet-expand-hook #'+latex-fold-last-macro-a))

(defun herwig/setup-flashcards ()
  "Sets up current buffer for writing math flashcards."
  (interactive)
  (progn
    ;; (+default/new-buffer)
    (find-file "~/flashcards.tex")
    (anki-editor-mode)
    (setq herwig/proof-lv nil)))

(defun herwig/push-cards ()
  "Pushes the cards out of LaTeX-Mode"
  (interactive)
  (progn
    (org-mode)
    (anki-editor-push-notes)
    (LaTeX-mode)))
