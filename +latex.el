;;; +latex.el -*- lexical-binding: t; -*-

;; Auto LaTeX Snippets
(use-package! auto-latex-snippets
  :hook (LaTeX-mode . auto-latex-snippets-mode)
  :config
  (add-hook 'als-post-snippet-expand-hook #'+latex-fold-last-macro-a))

;; Use Mixed Pitch Mode
(add-hook! LaTeX-mode #'mixed-pitch-mode)

(defun herwig/setup-flashcards ()
  "Sets up current buffer for writing math flashcards."
  (interactive)
  (progn
    ;; (+default/new-buffer)
    (setq herwig/proof-lv nil)
    (LaTeX-mode)
    (anki-editor-mode)
    (writeroom-mode)))

(defun herwig/push-cards ()
  "Pushes the cards out of LaTeX-Mode"
  (interactive)
  (progn
    (org-mode)
    (anki-editor-push-notes)
    (LaTeX-mode)
    (writeroom-mode)))
