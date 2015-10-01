;; Disable warnings
(setq warning-minimum-level :emergency)

;; General UI configurations
(menu-bar-mode -1)
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setq-default indent-tabs-mode nil)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Packages
(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    projectile
    auto-complete
    smex
    neotree
    magit
    which-key
    exec-path-from-shell
    monokai-theme
    pt
    epresent
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Theme
(load-theme 'monokai t)

;; Configuragions
(require 'ido)
(ido-mode t)
(ido-mode 1)
(ido-everywhere 1)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'projectile)
(projectile-global-mode)

(require 'auto-complete)
(ac-config-default)

(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right-bottom)
