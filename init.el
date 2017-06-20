
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;-----------MELPA packages------------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)
(defvar my/packages '(
		     ;;---auto-completion---
		     company
		     ;;---better editor
		     hungry-delete
		     swiper
		     counsel
		     smartparens
		     ;;---major mode
		     js2-mode
		     ;;---minor mode
		     nodejs-repl
		     exec-path-from-shell
		     ;;---themes
		     monokai-theme
		     ;;---solarizd-themes
		     ;;---smex
		     ;;smartparens
		     smartparens
		     ) "Default packages")
(setq package-selected-packages my/packages)
(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (my/packages-installed-p)
  (message "%s" "Refreshing package datebase...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;-------packages config--------------------------------------------------------------------
(require 'hungry-delete)       ;;use this mode
(global-hungry-delete-mode)
(load-theme 'monokai t)         ;;emacs theme color
(ivy-mode t)                     ;;counsel and swiper package for config
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-company-mode 1)    ;;auto completion(自动补全）
(setq-default company-idle-delay 0.08)
(setq-default company-minimum-prefix-length 1)
(require 'smartparens-config)                        ;;smartparens
(smartparens-global-mode t)
;;--------------------------------------------------------------------------------
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-linum-mode 1)      ;;行号模式
(tool-bar-mode -1)         ;;关闭工具栏
(scroll-bar-mode -1)       ;;关闭scroll(滚动栏）
(defun open-init-file ()                         ;;definition a function(定义一个函数)
  (interactive)                                  ;;交互使用此函数,M-x fun-name
  (find-file "~/.emacs.d/init.el"))

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-set-key (kbd "<f5>") 'open-init-file)    ;;绑定按键
(setq make-backup-files nil)                     ;;取消自动备份
(require 'recentf)                               ;;从文件中加载特性
(recentf-mode 1)
(setq recentf-max-menu-item 10)                  ;;打开最近的文件
(delete-selection-mode 1)                        ;;替换选中的文字
(setq inhibit-splash-screen 1)                   ;;关闭启动帮助画面
(set-face-attribute 'default nil :height 100)    ;;字体大小
(require 'org)
(setq org-src-fontify-natively t)                ;;org mode 的SRC块语句高亮
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "<f6>") 'recentf-open-files) 
(delete-selection-mode t)
(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;;全屏
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode t)

;;################################################################
;(add-to-list 'load-path "~/elisp-sites" "~/.emacs.d/config")
;(mapc 'load (directory-files "~/.emacs.d/config" t "^[[:alnum:]].*.el$"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
