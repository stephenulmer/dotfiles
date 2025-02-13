;; Sigh. Now I've got to have an Emacs init.

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Enable elisp package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Markdown Mode
(setq markdown-open-command "~/bin/marked")

(setq markdown-soma--render-buffer-hooks
  '(after-revert-hook
    after-save-hook
    after-change-functions
    post-command-hook))
```

;; Increase default display font size
(set-face-attribute 'default nil :height 160)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(markdown-soma ansible yaml-mode markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
