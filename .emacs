;(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)        ; Disable visible scrollbar
(column-number-mode 1)

(add-to-list 'default-frame-alist `(font . "Iosevka-20"))

;; parentesis
(show-paren-mode 1)
(electric-pair-mode 1)
;(set-fringe-mode 10)        ; Give some breathing room

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;;; ido 
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; line relative
(global-display-line-numbers-mode) 
(setq-default display-line-numbers-type 'relative)

;;; Melpa 
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


;; Fonts
;(set-face-attribute 'default nil
;		    :family "Iosevka Nerd Font"
;		    :height 200)
;(set-face-attribute 'variable-pitch nil
;		    :family "Cambria")
;(set-face-attribute 'fixed-pitch nil
;		    :family "Iosevka")

;; sustituye yes/no por y/n
(fset 'yes-or-no-p 'y-or-n-p)


;; Tiempo de visualización y el promedio de carga de CPU 
;(display-time)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(package-selected-packages
   '(duplicate-thing markdown-mode multiple-cursors yasnippet auto-complete use-package auctex magit company smex gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)

;;; Company
(require 'company)
(global-company-mode)
(global-set-key (kbd "C-c d") 'company-dabbrev)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package auctex 
  :ensure t 
  :defer t)
(setq TeX-view-program-selection '((output-pdf "Zathura")))

;;; auto-complete
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

;;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c k") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-c :") 'mc/skip-to-previous-like-this)

;;; move Text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; word-wrap
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;;(global-visual-line-mode)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)        ; Disable visible scrollbar
(column-number-mode 1)

;; parentesis
(show-paren-mode 1)
(electric-pair-mode 1)
;(set-fringe-mode 10)        ; Give some breathing room

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;;; ido 
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; line relative
(global-display-line-numbers-mode) 
(setq-default display-line-numbers-type 'relative)

;;; Melpa 
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


;; Fonts
(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 185)
(set-face-attribute 'variable-pitch nil
		    :family "Cambria")
(set-face-attribute 'fixed-pitch nil
		    :family "Iosevka")

;; sustituye yes/no por y/n
(fset 'yes-or-no-p 'y-or-n-p)


;; Tiempo de visualización y el promedio de carga de CPU 
;(display-time)




(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)

;;; Company
(require 'company)
(global-company-mode)
(global-set-key (kbd "C-c d") 'company-dabbrev)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package auctex 
  :ensure t 
  :defer t)
(setq TeX-view-program-selection '((output-pdf "Zathura")))

;;; auto-complete
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

;;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c k") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-c :") 'mc/skip-to-previous-like-this)

;;; move Text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; word-wrap
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;;(global-visual-line-mode)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)        ; Disable visible scrollbar
(column-number-mode 1)

;; parentesis
(show-paren-mode 1)
(electric-pair-mode 1)
;(set-fringe-mode 10)        ; Give some breathing room

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;;; ido 
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; line relative
(global-display-line-numbers-mode) 
(setq-default display-line-numbers-type 'relative)

;;; Melpa 
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)


;; Fonts
(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 185)
(set-face-attribute 'variable-pitch nil
		    :family "Cambria")
(set-face-attribute 'fixed-pitch nil
		    :family "Iosevka")

;; sustituye yes/no por y/n
(fset 'yes-or-no-p 'y-or-n-p)


;; Tiempo de visualización y el promedio de carga de CPU 
;(display-time)




(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)

;;; Company
(require 'company)
(global-company-mode)
(global-set-key (kbd "C-c d") 'company-dabbrev)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package auctex 
  :ensure t 
  :defer t)
(setq TeX-view-program-selection '((output-pdf "Zathura")))

;;; auto-complete
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

;;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c k") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-c :") 'mc/skip-to-previous-like-this)

;;; move Text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; word-wrap
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

