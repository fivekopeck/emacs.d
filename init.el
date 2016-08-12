

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


;(require 'sr-speedbar)
;(setq sr-speedbar-toggle t)
;(setq sr-speedbar-open t)
;(setq speedbar-show-unknown-files t) ; show all files
;(setq speedbar-use-images nil) ; use text for buttons
;(setq sr-speedbar-right-side nil) ; put on left side
(require 'lazy-set-key)
(require 'speedbar)
(require 'sr-speedbar)

;;; Code:

(setq speedbar-show-unknown-files t)    ;显示文件
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-right-side nil)
(setq speedbar-buffers-key-map nil)     ;卸载一些按键
(setq speedbar-file-key-map nil)
(lazy-set-key
 '(
   ;; 导航操作
   ("f" . speedbar-edit-line)             ;进入当前条目
   ("C-m" . speedbar-edit-line)           ;进入当前条目
   ("j" . speedbar-next)                  ;下一行
   ("k" . speedbar-prev)                  ;上一行
   ("n" . speedbar-forward-list)          ;下一条目
   ("p" . speedbar-backward-list)         ;上一条目
   ("u" . speedbar-forced-contract)       ;跳到上一级
   ("F" . speedbar-files)                 ;切换文件视图
   ("B" . speedbar-buffers)               ;切换缓存视图
   ("q" . sr-speedbar-toggle)             ;退出
   ;; 树操作
   ("x" . speedbar-expand-line)           ;展开当前行
   ("z" . speedbar-contract-line)         ;收缩当前行
   ("v" . speedbar-toggle-line-expansion) ;切换当前行的状态
   ;; 文件操作
   ("g" . speedbar-refresh)             ;刷新
   ("'" . speedbar-up-directory)        ;上一级目录
   ("i" . speedbar-item-info)           ;显示信息
   ("b" . speedbar-item-byte-compile)   ;编译
   ("l" . speedbar-item-load)           ;加载
   ("c" . speedbar-item-copy)           ;拷贝
   ("d" . speedbar-item-delete)         ;删除
   ("o" . speedbar-item-object-delete)  ;删除对象
   ("r" . speedbar-item-rename)         ;重命令
   ("m" . speedbar-create-directory)    ;创建目录
   ("K" . speedbar-buffer-kill-buffer)  ;关闭当前buffer
   )
 speedbar-key-map
 )

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



