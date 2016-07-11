

; start package.el with emacs
(require 'package)
; add MELPA to repository list
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(setq package-archives
            '(
              ("gnu" . "http://elpa.gnu.org/packages/")
              ("melpa" . "http://melpa.milkbox.net/packages/")
              ("marmalade" . "http://marmalade-repo.org/packages/")))
                                        ; initialize package.el

;(add-to-list 'load-path (expand-file-name "~/emacs.d/modules/"))
(add-to-list 'load-path "~/.emacs.d/modules/")

(package-initialize)

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/modules/")
;(setq auto-install-save-confirm nil)

(require 'auto-complete)
(global-auto-complete-mode t)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;(require ‘perl-completion)


;(add-to-list 'load-path "~/.emacs.d/pde")
(load "pde-load")
;;-------------------------------------------------------
;; Perl
;;-------------------------------------------------------
(defalias 'perl-mode 'cperl-mode)
;; -- Emacs::PDE
(add-hook 'cperl-mode-hook '(lambda () (load "pde-load") (abbrev-mode 0)))
(add-hook 'cperl-mode-hook '(lambda () (yas/minor-mode)))
(add-hook 'cperl-mode-hook '(lambda () (require 'perl-completion) (perl-completion-mode t)))
(add-hook 'cperl-mode-hook '(lambda ()
                                    (when (require 'auto-complete nil t)
                                      (auto-complete-mode t)
                                      (make-variable-buffer-local 'ac-sources)
                                      (setq ac-sources
                                                  '(ac-source-perl-completion)))))



