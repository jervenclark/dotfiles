;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jerven Clark Chua"
      user-mail-address "jervenclark.chua@gmail.com")

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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-city-lights)

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

(setq tramp-copy-size-limit nil)


(use-package windmove
  :ensure nil
  :bind
  (("C-S-<left>". windmove-left)
   ("C-S-<right>". windmove-right)
   ("C-S-<up>". windmove-up)
   ("C-S-<down>". windmove-down)))

(map! :leader
      (:prefix-map ("a" . "personal")

       ;; Multicursor keybinds
       (:prefix ("m" . "multicursor")
        :desc "mark all like this" "l" #'mc/mark-all-like-this-dwim
        :desc "mark all in function" "f" #'mc/mark-all-like-this-in-defun

        :desc "mark next like this" "n" #'mc/mark-next-like-this
        :desc "mark prev like this" "p" #'mc/mark-previous-like-this

        :desc "edit lines" "e" #'mc/edit-lines
        :desc "edit beginning of lines" "a" #'mc/edit-beginnings-of-lines
        :desc "edit ends of lines" "z" #'mc/edit-ends-of-lines)

       ;; Misc
       (:prefix ("e" . "editing")
        :desc "align regexp" "a" #'align-regexp
        :desc "sort lines" "s" #'sort-lines
        :desc "replace string" "r" #'replace-string)

       ;; Navigation
       (:prefix ("n" . "navigation")
        :desc "move up" "<up>" #'windmove-up
        :desc "move down" "<down>" #'windmove-down
        :desc "move left" "<left>" #'windmove-left
        :desc "move right" "<right>" #'windmove-right)

       ))

(use-package! python-black
  :demand t
  :after python
  :config
  (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  ;; Feel free to throw your own personal keybindings here
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)
)

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
