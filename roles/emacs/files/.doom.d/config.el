;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-



;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-hybrid-material)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 14))
;; (setq doom-font (font-spec :family "Operator Mono SSm Book" :size 14))
(setq doom-font (font-spec :family "Iosevka Term" :size 14))

(setq-default line-spacing 2)

(setq all-the-icons-color-icons t)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq ns-use-thin-smoothing t)

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "TODO=\"TODO\""
                ((org-agenda-todo-list-sublevels nil)
                 (org-agenda-prefix-format '((tags . " %i %-12:c %b")))
                 (org-agenda-overriding-header "Projects")))
          (agenda "")
          (alltodo "")))))

(add-hook 'auto-save-hook 'org-save-all-org-buffers)

(after! org
  (setq org-todo-keyword-faces
        '(("MAYB" . "orange")
          ("DONT" . "grey")))

  (setq org-todo-keywords
      (quote ((sequence
               "TODO(t)"
               "NEXT(n)"
               "OPEN(o)"
               "|"
               "DONE(d)")
              (sequence
               "MAYB(m/!)"
               "WAIT(w@/!)"
               "|"
               "DEAD(k@/!)"
               "MEET(e)")
              (sequence
               "WANT(b@/!)"
               "SELL(s@/!)"
               "GIVE(g@/!)"
               "|"
               "HAVE(h@/!)"
               "SOLD(l@/!)"
               "DUMP(p@/!)"
               "GAVE(v@/!)")))))

(after! org
  (setq org-capture-templates
        '(("j" "Journal")
          ("jj" "Standard Journal" entry (file+olp+datetree "~/org/journal_2021.org")
           "** %U - %?")
          ("j2" "2C Journal" entry (file+olp+datetree "~/org/journal_2021.org")
           "** %U - %? :2C:")
          ("i" "Inventory")
          ("iw" "Inventory WANT (w)" entry (file+olp "~/org/me.org" "INBOX")
           "* WANT %?")
          ("t" "Tasks")
          ("tt" "Task TODO (t)" entry (file+olp "~/org/me.org" "INBOX")
           "** TODO %?"))))

(setq org-log-done (quote time))
(setq org-log-into-drawer t)
(setq org-log-state-notes-insert-after-drawers nil)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; Change tasks to whatever when clocking in
;; (setq org-clock-in-switch-to-state "NEXT")
;; Save clock data and state changes and notes in the LOGBOOK drawer
;; (setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks
;; with 0:00 duration
;; (setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
;; (setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
;; (setq org-clock-persist t)
;; Do not prompt to resume an active clock
;; (setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports

;; (load! "~/secrets/emacs/org-gcal.el")

(setq doom-themes-treemacs-enable-variable-pitch nil)

;; (dolist (face '(treemacs-root-face
;;                 treemacs-git-unmodified-face
;;                 treemacs-git-modified-face
;;                 treemacs-git-renamed-face
;;                 treemacs-git-ignored-face
;;                 treemacs-git-untracked-face
;;                 treemacs-git-added-face
;;                 treemacs-git-conflict-face
;;                 treemacs-directory-face
;;                 treemacs-directory-collapsed-face
;;                 treemacs-file-face
;;                 treemacs-tags-face))
;;   (set-face-attribute face nil :family "Iosevka Term" :height 140))



(use-package! doom-themes
    ;; :init (load-theme 'doom-one t)
    :config
    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)

    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config)

    ;; Enable custom treemacs theme (all-the-icons must be installed!)
    (doom-themes-treemacs-config))

(use-package! all-the-icons)
(use-package! all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
