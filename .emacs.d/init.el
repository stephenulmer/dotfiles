;;
;; Sigh. Now I've got to have an Emacs init.
;;

;; Set-up the elisp package manager
(require 'package) ; package-archives must exist to be added to
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))


;; Configure the packages I use
(use-package format-all)
(use-package markdown-mode
  :hook (markdown-mode . auto-fill-mode)
  :config (setq markdown-open-command "~/bin/marked"))
(use-package python-mode)
(use-package yaml-mode)


;; evaluate for future use
;(use-package obsidian)

;; find corret markdown-mode versions and move to use-package
;(setq markdown-soma--render-buffer-hooks
;  '(after-revert-hook
;    after-save-hook
;    after-change-functions
;    post-command-hook))

```

;; Increase default display font size
(set-face-attribute 'default nil :height 160)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
