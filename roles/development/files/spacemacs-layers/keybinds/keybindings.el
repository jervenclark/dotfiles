;; title             : config.el
;; description       : Personal keybinds for spacemacs
;; author            : Jerven Clark Chua
;; email             : jervenclark@gmail.com
;; date              : 2020-08-03
;; version           : 0.0.1
;; usage             : dotspacemacs-configuration-layers '( keybinds )
;; notes             :
;; spacemacs_version : 0.300.0
;; emacs_version     : 26.3


;;==============================================================================
;; Multiple cursors
;;==============================================================================
;; Mark multiple symbols

(spacemacs/set-leader-keys "o c l" 'mc/mark-all-like-this)
(spacemacs/set-leader-keys "o c d" 'mc/mark-all-dwim)
(spacemacs/set-leader-keys "o c f" 'mc/mark-all-like-this-in-defun)

;; Mark singular symbol
(spacemacs/set-leader-keys "o c >" 'mc/mark-next-like-this)
(spacemacs/set-leader-keys "o c <" 'mc/mark-previous-like-this)

;; Edit lines
(spacemacs/set-leader-keys "o c e" 'mc/edit-lines)
(spacemacs/set-leader-keys "o c a" 'mc/edit-beginnings-of-lines)
(spacemacs/set-leader-keys "o c z" 'mc/edit-ends-of-lines)

;; Insert symbols
(spacemacs/set-leader-keys "o c n" 'mc/insert-numbers)
(spacemacs/set-leader-keys "o c n" 'mc/insert-letters)


;;==============================================================================
;; Misc
;;==============================================================================
(spacemacs/set-leader-keys "o a" 'align-regexp)
(spacemacs/set-leader-keys "o s" 'sort-lines)
(spacemacs/set-leader-keys "o r" 'replace-string)


;;==============================================================================
;; Major Modes
;;==============================================================================
(spacemacs/set-leader-keys "o m w" 'web-mode)
