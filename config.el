;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Herwig Hoehenberger"
      user-mail-address "herwig.hoehenberger@gmail.com"
      epa-file-encrypt-to user-mail-address)

(setq-default
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq auto-save-default t                         ; please auto-save my work
      sentence-end-double-space t                 ; the only correct choice
      default-input-method "german-postfix"       ; for when I need to type ä, ö, ü or ß
      evil-want-fine-undo t                       ; the finer the undo, the better
      inhibit-compacting-font-caches t            ; when there are a lot of glyphs, keep them in memory
      undo-limit 80000000                         ; the more the undo, the better
      +evil-want-o/O-to-continue-comments nil)

(delete-selection-mode 1)                         ; Replace selection when inserting text
(global-subword-mode 1)                           ; Iterate through CamelCase words

(map!
 :leader
 ":" nil
 :desc "M-x" "SPC" #'counsel-M-x)

(map!
 :leader
 (:prefix ("b" . "buffer")
  :desc "ibuffer" "i" #'ibuffer))

(after! git-timemachine
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook! git-timemachine-mode-hook #'evil-normalize-keymaps))

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)

(setq doom-font (font-spec :family "Fira Code" :size (if IS-MAC 14.0 11.0))
      doom-big-font (font-spec :family "Fira Code" :size (if IS-MAC 18.0 14.0))
      doom-variable-pitch-font (font-spec :family "Overpass" :size (if IS-MAC 14.0 11.0)))

(setq doom-theme 'doom-nord)

(setq display-line-numbers-type nil
      evil-echo-state nil                      ; I find it distracting; and I can tell the state from the cursor
      frame-title-format "%b"
      mode-line-default-help-echo nil
      scroll-bar-mode nil
      show-help-function nil
      show-paren-delay 0)

(after!
    (setq calc-angle-mode 'rad
          calc-algebraic-mode t
          calc-symbolic-mode t)
    (evil-set-initial-state 'calc-mode 'emacs))

(after! company
  (setq company-idle-delay nil))

(after! direnv
  (setq direnv-always-show-summary nil))

(use-package! evil-tex
  :hook (latex-mode . evil-tex-mode))

(use-package! hercules
  :config
  (hercules-def
   :show-funs #'macrostep-expand
   :hide-funs #'macrostep-collapse-all
   :keymap 'macrostep-keymap))

(after! which-key
  (setq which-key-idle-delay 0.5)
  (setq which-key-allow-multiple-replacements t)
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))))

(after! haskell
  (setq haskell-interactive-popup-errors nil))

(add-hook! LaTeX-mode #'mixed-pitch-mode)

(after! python
  (setq python-shell-interpreter "ipython"))

(setq
 org-directory (expand-file-name "Org" (getenv "HOME"))
 org-archive-location (expand-file-name ".archive/%s::" org-directory)
 org-blank-before-new-entry '((heading . nil) (plain-list-item . nil))
 org-catch-invisible-edits 'smart
 org-ellipsis " ▼ "
 org-export-in-background t
 org-list-allow-alphabetical t)

(after! org
  (setq org-refile-targets '((nil :maxlevel . 7) (org-agenda-files :maxlevel . 7))
        org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷")))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(after! org
  (map!
    (:map org-mode-map
     :localleader
       "e" nil
       "i" nil))
  (map!
    (:map org-mode-map
     :localleader
        (:prefix ("e" . "export")
          :desc "org-export-dispatch" "d" #'org-export-dispatch)

        (:prefix ("i" . "insert")
          :desc "org-insert-heading-after-current" "h" #'org-insert-heading-after-current
          :desc "org-insert-heading" "H" #'org-insert-heading
          :desc "org-insert-subheading" "s" #'org-insert-subheading))))

(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-include-deadlines t
      org-agenda-start-day "-1d"
      org-agenda-show-future-repeats 'next
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t)

(setq org-agenda-custom-commands
      '(("f" "Forecast"
         ((agenda "" ((org-agenda-start-day "today")
                      (org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Overdue"
                          :and (:not (:habit t)
                                :scheduled past)
                          :and (:not (:habit t)
                                :deadline past))
                         (:name "Forecast"
                          :time-grid t
                          :date today
                          :scheduled today
                          :deadline today
                          :habit t
                          :discard (:anything t))))))))))

(after! org
  (setq org-capture-templates
    '(("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox") "** TODO %?\n %i\n %a")
      ("n" "Note" plain (function org-roam-capture) "%?"))))

(after! org-journal
  (setq org-journal-dir (expand-file-name "Journal" org-directory)
        org-journal-file-format "1%Y/%m %B.org" ;; e.g. 12019/04 April.org
        org-journal-encrypt-journal t
        org-journal-file-type 'monthly
        org-journal-date-prefix "* "
        org-journal-date-format "1%F %a" ;; e.g. 12019-04-01 Fri
        ;; see here for formatting symbols: https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
        org-journal-time-prefix "** "
        org-journal-time-format "")
  (defun herwig/setup-entry ()
    (progn
      (toggl-start-time-entry "Journal" (toggl-get-pid "Solitude") "Journal Timer Started!")
      (doom/window-maximize-buffer)
      (company-mode -1)
      (evil-scroll-line-to-top (line-number-at-pos))
      (evil-scroll-line-up 2)
      (flyspell-mode)))
  (add-hook! org-journal-after-entry-create #'herwig/setup-entry))

(map!
 :leader
 (:prefix ("n" . "notes")
  :desc "Org Journal" "j" #'org-journal-new-entry))

(after! org-roam
  (setq org-roam-directory (expand-file-name "Cerebro" org-directory)))

(use-package! org-toggl
  :config
  (setq toggl-auth-token "5e48e18d607c8512c580f4dc4d303cc6")
  (setq org-toggl-inherit-toggl-properties t)
  (toggl-get-projects))

(add-hook! org-mode #'+org-pretty-mode #'mixed-pitch-mode)

(after! geiser
  (setq geiser-active-implementations '(mit)
        geiser-default-implementation 'mit))
