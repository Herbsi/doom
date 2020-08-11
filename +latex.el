;;; +latex.el -*- lexical-binding: t; -*-

;; Auto LaTeX Snippets
(use-package! auto-latex-snippets
  :hook (LaTeX-mode . auto-latex-snippets-mode)
  :config
  (add-hook 'als-post-snippet-expand-hook #'+latex-fold-last-macro-a))

;; Evil-Tex
(use-package! evil-tex
  :hook (LaTeX-mode . evil-tex-mode))

;; Use Mixed Pitch Mode
(add-hook! LaTeX-mode #'mixed-pitch-mode)

(defun herwig/setup-flashcards ()
  (interactive)
  (progn
    (+default/new-buffer)
    (LaTeX-mode)
    (anki-editor-mode)
    (writeroom-mode)))
