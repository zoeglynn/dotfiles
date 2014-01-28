;; .emacs
;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

; Red Hat Linux default .emacs initialization file
(set-variable 'display-time-day-and-date t)

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; make end and home keys work again in emacs21
(global-set-key [end] 'end-of-buffer)
(global-set-key [home] 'beginning-of-buffer)

;; always have goto-line available
;(global-set-key "\C-c\C-l" 'goto-line)
; above was previously used within some mode.. may reinstate, but for now...
(global-set-key [f9] 'goto-line)

;; dont use insane minimise
(global-unset-key "\C-z")

;; Enable wheelmouse support by default
(require 'mwheel)

;; above stuff doesnt work for v21 :(
;; cool scroll mouse stuff
(defun scroll-down-1 () "" (interactive) (progn (scroll-down 1)))
(defun scroll-up-1 () "" (interactive) (progn (scroll-up 1)))
(defun scroll-down-4 () "" (interactive) (progn (scroll-down 4)))
(defun scroll-up-4 () "" (interactive) (progn (scroll-up 4)))
(defun scroll-down-other-window-4 () "" (interactive) (progn
(scroll-other-window-down 4)))
(defun scroll-up-other-window-4 () "" (interactive) (progn
(scroll-other-window-down -4)))
(cond ((not running-xemacs)
       (global-set-key [C-mouse-4]     'scroll-down)
       (global-set-key [C-mouse-5]     'scroll-up)
       (global-set-key [mouse-4]       'scroll-down-4)
       (global-set-key [mouse-5]       'scroll-up-4)
       (global-set-key [S-mouse-4]     'scroll-down-1)
       (global-set-key [S-mouse-5]     'scroll-up-1)
       (global-set-key [M-mouse-4]     'scroll-down-other-window-4)
       (global-set-key [M-mouse-5]     'scroll-up-other-window-4)
))
; for moving to word ending/beginnings in -nw mode
;;* doesnt work.. control key combinations dont seem to be passed in
;(global-set-key [ESC-left] 'backward-word)
;(global-set-key [C-left] 'backward-word)
;(global-set-key [ESC-right] 'forward-word)
;(global-set-key [C-right] 'forward-word)

;; Use Emacs automagical global font lock mode
(global-font-lock-mode t)

; remove emacs 21 stuff
; get rid of scroll bar, tools & menu bar & set up colors
; (just for Emacs for now..)
(if (eq emacs-major-version 21)
    (cond ((eq running-xemacs t)
       (progn
;;          (set-specifier scrollbar-width 0)
;;          (customize-set-variable 'toolbar-visible-p nil)
;;          (set-specifier menubar-visible-p nil)
         (font-lock-mode t)
         ))
      ((not (eq window-system nil))
       (progn
         (tool-bar-mode -1)
         (blink-cursor-mode -1)
         (scroll-bar-mode -1)
         (menu-bar-mode -1)
         ;; Background colors
         (set-foreground-color "gainsboro")
         (set-background-color "black")
         ))
      )
  )
(setq inhibit-startup-message t)
(setq visible-bell t)

;; Show the column in the modeline
(column-number-mode 1)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; enable auto-sized minibuffer!
(resize-minibuffer-mode)
(if (not running-xemacs)
    (toggle-uniquify-buffer-names)
)

;; show region until something is done to it
(setq transient-mark-mode 1)

;; ;; RCS stuff
;; ;select RCS version control
;; (set-variable 'vc-default-back-end (quote RCS))
;; ;still make normal ~ backups
;; (set-variable 'vc-make-backup-files 1)
;; ;initial version number
;; (set-variable 'vc-default-init-version "1.0")
;; ;require an initial comment
;; (set-variable 'vc-initial-comment 1)

;; now in .emacs
;; Modes
; ILM C++ style
;; (defun setupC++indents ()
;;   (c-set-style "stroustrup")
;;   (setq indent-tabs-mode nil)
;;   )
;; (add-hook 'c++-mode-hook 'setupC++indents)

;; use c-mode when opening files with .shk extension
(setq auto-mode-alist (cons '("\\.shk$" . c-mode) auto-mode-alist))

; Mikey's cool shelly stuff
(global-set-key [f8] 'shell-resync-dirs)
(add-hook 'shell-mode-hook
          (function (lambda ()
              ; Allow global bindings to take precedence.
              (define-key comint-mode-map [(control up)] 'previous-line)
              (define-key comint-mode-map [(control down)] 'next-line)
              ; Call functions to go to end of buffer and do command.
              (define-key comint-mode-map [up] 'comint-previous-input)
              (define-key comint-mode-map [kp-up] 'previous-line)
              (define-key comint-mode-map [down] 'comint-next-input)
              (define-key comint-mode-map [kp-down] 'next-line)
              ; Remap ^A to go the beginning of line after prompt.
;             (set-variable 'comint-prompt-regexp "^[^?#$%>\n]*[?#$% >] *")
              (set-variable 'comint-prompt-regexp "^[^$\n]*[$%>:] ")
              (set-variable 'shell-prompt-pattern "^[^$\n]*[$%>:] ")
              (define-key comint-mode-map [(control a)] 'comint-bol)
  ))
)

(display-time)
(require 'shell "shell.elc")
;; Comment this entire conditional if you don't want nice emacs shell access
(if (not running-xemacs)
    (progn
      (shell)
      (rename-buffer "*dev-shell*")
      )
  )

(custom-set-variables
 '(load-home-init-file t))
(custom-set-faces)
