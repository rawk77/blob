(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(linum-mode)

(setq visible-bell t)
(setq ring-bell-function 'ignore)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Copy to System clipboard
(setq x-select-enable-clipboard t)

;; Fonts
(add-to-list 'default-frame-alist
	     '(font . "LiterationMono Nerd Font-11"))
(set-face-attribute 'default nil :font "LiterationMono Nerd Font-11" )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "f5e666fba0ded6ae9be004314ecf5f7feb605cdb84711b5c5ffd81acfb831183" "8721f7ee8cd0c2e56d23f757b44c39c249a58c60d33194fe546659dabc69eebd" default))
 '(package-selected-packages
   '(doom-themes marginalia catppuccin-theme doom-modeline dracula-theme ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'catppuccin :no-config)
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Enable vertico
(use-package vertico
  :ensure t
  :bind (:map vertico-map
	      ("M-j" . vertico-next)
	      ("M-k" . vertico-previous)
	      ("M-f" . vertico-exit)
	      :map minibuffer-local-map
	      ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;; Marginalia w/vertico.  Adds more details about files and buffers
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))
