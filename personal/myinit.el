;;; myinit.el --- my crap
;;; Commentary:
;;
;;; Code:

;; Auto-complete stuff
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")

(require 'go-autocomplete)

(setq ecb-tip-of-the-day nil)
(setq-default tab-width 4)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key (kbd "C-c <C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c <C-down>") 'shrink-window)
(global-set-key (kbd "C-c <C-up>") 'enlarge-window)

;; Tab stuff
(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4)          ; and 4 char wide for TAB
(setq-default indent-tabs-mode nil) ; And force use of spaces

;; Add F12 to toggle line wrap
(global-set-key [f12] 'toggle-truncate-lines)
;; Read only prompt
(add-hook 'shell-mode-hook
          '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;;; myinit.el ends here
