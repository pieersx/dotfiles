;(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)        ; Disable visible scrollbar
(column-number-mode 1)

;(add-to-list 'default-frame-alist `(font . "Iosevka Nerd Font-20"))
;; Fonts
(set-face-attribute 'default nil
		    :family "Iosevka Nerd Font"
		    :height 200)
(set-face-attribute 'variable-pitch nil
		    :family "Roboto"
		    :height 150)
(set-face-attribute 'fixed-pitch nil
		    :family "Iosevka")

;; parentesis
(show-paren-mode 1)
(electric-pair-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;;; ido 
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; line relative
(global-display-line-numbers-mode) 
(setq-default display-line-numbers-type 'relative)

;;; Melpa 
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Lista de paquetes necesarios
(setq my-packages
      '(company
        multiple-cursors
        move-text
        duplicate-thing))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(package-selected-packages
   '(duplicate-thing move-text multiple-cursors company smex gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Company
; (unless (package-installed-p 'company)
;  (package-install 'company))
(require 'company) 
(global-company-mode)
(global-set-key (kbd "C-c d") 'company-dabbrev)

;;; multiple-cursors
; (unless (package-installed-p 'multiple-cursors)
;  (package-install 'multiple-cursors))
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
; (unless (package-installed-p 'move-text)
;  (package-install 'move-text))
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; word-wrap
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;;; Duplicate line
; (unless (package-installed-p 'duplicate-thing)
;  (package-install 'duplicate-thing))
(require 'duplicate-thing)
(global-set-key (kbd "C-,") 'duplicate-thing)

;; sustituye yes/no por y/n
(fset 'yes-or-no-p 'y-or-n-p)
