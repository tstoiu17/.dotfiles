;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18))
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")
(setq which-key-idle-delay 0.5)
(setq which-key-idle-secondary-delay 0.05)
(setq which-key-use-C-h-commands t)
(setq which-key-side-window-max-height 0.75)

(map!
 :desc "Increment number" :nv "+" #'evil-numbers/inc-at-pt
 :desc "Decrement number" :nv "-" #'evil-numbers/dec-at-pt
 (:prefix "g"
  :desc "Increment number (incremental)" :nv "+" #'evil-numbers/inc-at-pt-incremental
  :desc "Decrement number (Incremental)" :nv "-" #'evil-numbers/dec-at-pt-incremental)
 (:prefix "\\"
  :desc "Quit" :n "q" #'evil-quit
  :desc "Quit all" :n "Q" #'evil-quit-all
  :desc "Save" :n "w" #'save-buffer
  :desc "Save and close" :n "x" #'evil-save-and-close))

;; TODO map "s" to C-w for window actions
;; TODO map "backspace" to go up one level in which-key
;; TODO map which-key paging binds to something
