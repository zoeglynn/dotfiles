(set-variable 'display-time-day-and-date t)
(setq inhibit-startup-message t)
(setq visible-bell t)


;; Show the column in the modeline
(column-number-mode 1)

;; Always end a file with a newline
(setq require-final-newline t)

(toggle-uniquify-buffer-names)

;; already enabled
;; Stop at the end of the file, not just add lines
;(setq next-line-add-newlines nil)

;; show region until something is done to it
;(setq transient-mark-mode 1)

; Mikey's cool shelly stuff
; (global-set-key [f8] 'shell-resync-dirs)
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
  ))
)

;; Enable scroll via touchpad
(defun scroll-down-1 () "" (interactive) (progn (scroll-down 1)))
(defun scroll-up-1 () "" (interactive) (progn (scroll-up 1)))
(defun scroll-down-4 () "" (interactive) (progn (scroll-down 4)))
(defun scroll-up-4 () "" (interactive) (progn (scroll-up 4)))
(defun scroll-down-other-window-1 () "" (interactive) (progn
(scroll-other-window -1)))
(defun scroll-up-other-window-1 () "" (interactive) (progn
(scroll-other-window 1)))
(defun scroll-down-other-window-4 () "" (interactive) (progn
(scroll-other-window -4)))
(defun scroll-up-other-window-4 () "" (interactive) (progn
(scroll-other-window 4)))
(global-set-key [wheel-down]        'scroll-up-1)
(global-set-key [wheel-up]          'scroll-down-1)
(global-set-key [double-wheel-down] 'scroll-up)
(global-set-key [double-wheel-up]   'scroll-down)
(global-set-key [triple-wheel-down] 'scroll-up-4)
(global-set-key [triple-wheel-up]   'scroll-down-4)
(global-set-key [M-wheel-down]      'scroll-up-other-window-1)
(global-set-key [M-wheel-up]        'scroll-down-other-window-1)
(global-set-key [M-double-wheel-down] 'scroll-other-window)
(global-set-key [M-double-wheel-up]   'scroll-other-window-down)
(global-set-key [M-triple-wheel-down] 'scroll-up-other-window-4)
(global-set-key [M-triple-wheel-up]   'scroll-down-other-window-4)


;; Ruby on Rails support
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
;; (add-to-list 'load-path "~/.emacs.d/elisp/rinari/rhtml")
(require 'rinari)

;; use ruby-mode when opening files with .rake extension
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))

(require 'shell "shell.elc")
;; Comment this entire statement if you don't want nice emacs shell access
(progn
  (shell)
  (rename-buffer "*dev-shell*")
)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
