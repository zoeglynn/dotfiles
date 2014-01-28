(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cc-other-file-alist (quote (("\\.cc\\'" (".hh" ".h")) ("\\.hh\\'" (".cc" ".C")) ("\\.c\\'" (".h")) ("\\.h\\'" (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m")) ("\\.C\\'" (".H" ".hh" ".h")) ("\\.H\\'" (".C" ".CC")) ("\\.CC\\'" (".HH" ".H" ".hh" ".h")) ("\\.HH\\'" (".CC")) ("\\.c\\+\\+\\'" (".h++" ".hh" ".h")) ("\\.h\\+\\+\\'" (".c++")) ("\\.cpp\\'" (".hpp" ".hh" ".h")) ("\\.hpp\\'" (".cpp")) ("\\.cxx\\'" (".hxx" ".hh" ".h")) ("\\.hxx\\'" (".cxx")) ("\\.m\\'" (".h")))))
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(js2-bounce-indent-p t)
 '(safe-local-variable-values (quote ((js2-basic-offset . 2))))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


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

; ILM C++ style
(defun setupC++indents ()
  (c-set-style "stroustrup")
  (setq indent-tabs-mode nil)
  )
(add-hook 'c++-mode-hook 'setupC++indents)

; Java
(defun setupJavaMode ()
  (c-set-style "stroustrup")
  (set-variable 'tab-width 4)
  (setq indent-tabs-mode nil)
  )
(add-hook 'java-mode-hook 'setupJavaMode)

(defun setupJavascriptMode ()
  (set-variable 'tab-width 4)
  (setq indent-tabs-mode nil)
  )
(add-hook 'javascript-mode-hook 'setupJavascriptMode)

;; http://code.google.com/p/js2-mode/
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; RHTML
(defun setupRHTMLMode ()
  (set-variable 'tab-width 4)
  (setq indent-tabs-mode nil)
  )
(add-hook 'rhtml-mode-hook 'setupRHTMLMode)

(add-to-list 'load-path "~/.emacs.d/elisp")
; HAML
(add-hook 'haml-mode-hook
		  '(lambda ()
			 (setq indent-tabs-mode nil)
			 (define-key haml-mode-map "\C-m" 'newline-and-indent)))
(autoload 'haml-mode "haml-mode")

; SASS
(autoload 'sass-mode "sass-mode")

; SCSS
(setq exec-path (cons (expand-file-name "/Library/Ruby/Gems/1.8/gems") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

; OBJ-C
(setq magic-mode-alist
  (append (list  
       '("\\(.\\|\n\\)*\n@implementation" . objc-mode)
       '("\\(.\\|\n\\)*\n@interface" . objc-mode)
       '("\\(.\\|\n\\)*\n@protocol" . objc-mode))
      magic-mode-alist))

;; GAH, debug this after - for now, just write it in custom-set-variables
;; ;; need find-file to do this
;; (require 'find-file)
;; ;; find-file doesn't grok objc files for some reason, add that
;; (push ".m" (cadr (assoc "\\.h\\'" cc-other-file-alist)))
;; (setq cc-other-file-alist
;;   (append '(
;; 	    ("\\.m\\'" (".h"))
;; 	    ) cc-other-file-alist))

(defun setupOBJCMode ()
  (set-variable 'tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode 1)
  (global-set-key [M-s-up]   'ff-find-other-file)
  )
(add-hook 'objc-mode-hook 'setupOBJCMode)


(require 'shell "shell.elc")
;; Comment this entire statement if you don't want nice emacs shell access
(progn
  (shell)
  (rename-buffer "*dev-shell*")
)

