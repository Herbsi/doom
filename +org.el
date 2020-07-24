;;; +org.el -*- lexical-binding: t; -*-

;; General
;; Set defaults
(setq
 org-directory (expand-file-name "Org" (getenv "HOME"))
 org-archive-location (expand-file-name ".archive/%s::" org-directory)
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
 org-catch-invisible-edits 'smart
 org-export-in-background t
 org-list-allow-alphabetical t)


;; Anki
(use-package anki-editor
  :after org
  :init
  (setq-default anki-editor-use-math-jax t))

;; org-crypt
(after! org
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt"))
        org-crypt-key "F1653669C24076F7"))

;; org-journal
(setq org-journal-dir (expand-file-name "Journal" org-directory))
(after! org-journal
  (setq org-journal-file-format "1%Y/%m %B.org" ;; e.g. 12019/04 April.org
        org-journal-encrypt-journal t
        org-journal-file-type 'monthly
        org-journal-date-prefix "* "
        org-journal-date-format "1%F %a" ;; e.g. 12019-04-01 Fri
        ;; see here for formatting symbols: https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
        org-journal-time-prefix "** "
        org-journal-time-format "")

  (defun herwig/setup-entry ()
    "Function to run when entering a new journal entry.

Sets up everything the way I want it to be when journaling."
    (progn
      (toggl-start-time-entry "Journal" (toggl-get-pid "Solitude") "Journal Timer Started!")
      (doom/window-maximize-buffer)
      (evil-scroll-line-to-top (line-number-at-pos))
      (evil-scroll-line-up 2)
      (writeroom-mode)
      (turn-on-flyspell)))
  (add-hook! org-journal-after-entry-create #'herwig/setup-entry))

(map!
 :leader
 (:prefix ("n" . "notes")
  :desc "Org Journal" "j" #'org-journal-new-entry))

;; org-roam
(setq org-roam-directory (expand-file-name "Cerebro" org-directory))

;; org-toggl
(use-package! org-toggl
  :after org-journal
  :config
  (load-library (expand-file-name "toggl-auth-token.el.gpg" doom-private-dir))
  (setq org-toggl-inherit-toggl-properties t)
  (toggl-get-projects))

;; Visuals
(add-hook! org-mode #'(+org-pretty-mode mixed-pitch-mode))

;; Symbols
;; Source: [[https://tecosaur.github.io/emacs-config/config.html][doom configuration]]
(after! org
  (setq org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷")
        org-super-star-prettify-item-bullets t)
  (setq org-ellipsis " ▼ "
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces '((?A . 'all-the-icons-red)
                             (?B . 'all-the-icons-orange)
                             (?C . 'all-the-icons-yellow)
                             (?D . 'all-the-icons-green)
                             (?E . 'all-the-icons-blue))))
