
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;调整窗口尺寸
;;===================================================
(set-frame-position (selected-frame) 1000 0);;设置窗口位置为屏库左上角(0,0)
(set-frame-width (selected-frame) 100);;设置宽和高
(set-frame-height (selected-frame) 60)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;透明
;;================================================================
(set-frame-parameter (selected-frame) 'alpha (list 85 50))
(add-to-list 'default-frame-alist (cons 'alpha (list 85 50)))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;显示时间
;;===================================================
;(display-time-24hr-format t)
(display-time-mode t)
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-format "%H:%M%A%m月%d日") ;;显示时间格式
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;(global-linum-mode) ;显示行号
;;(setq column-number-mode t);显示行号
(tool-bar-mode -1) ;不显示图标栏
(setq initial-scratch-message "");不显示启动界面
(menu-bar-mode 1) ;隐藏菜单栏

(set-default-font "黑体-11")  ;;"新宋体"为中英文等宽字体, 用于表格对齐   新宋体-10
(set-locale-environment "zh_CN.UTF-8")

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;简单功能
;;================================================================
(setq mouse-yank-at-point t);鼠标中键粘贴
(fset 'yes-or-no-p 'y-or-n-p) ;yes简称
(setq make-backup-files nil);禁止备份文件"~
(setq auto-save-default nil);;禁止自动保存文件
;;(setq mouse-drag-copy-region t) ;;鼠标快速复制
(find-file "E:/develop/emacs/temp.org");;启动时打开文件
(setq default-major-mode 'org-mode) ;;把缺省的 major mode 设置为 text-mode
(add-to-list 'load-path "E:/develop/emacs/");;添加查找路径
(setq diary-file "E:/develop/emacs/diary") ;设置日记文件路径
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode) ;打开yas模板
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;设置编码格式
;;=======================================================================
(setq default-buffer-file-coding-system 'gb18030)
(prefer-coding-system 'gb18030)
;;(prefer-coding-system 'utf-8)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;设置自定义快捷键--创建新的 prefix command
;;================================================================
(define-prefix-command 'alt-t-map)
(global-set-key (kbd "M-t") 'alt-t-map)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;访问文件
;;================================================================
(defconst my-emacs-path "E:/develop/emacs/")  ;;设置常量
(defun visit-learnemacs()
  (interactive)
  (find-file (concat my-emacs-path "学习笔记.org")))
(global-set-key (kbd "M-t h")' visit-learnemacs)
(defun visit-.emacs()
  (interactive)
  (find-file "~/.tk.emacs/emacs_set.org"))
(global-set-key (kbd "M-t x") 'visit-.emacs)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;增加简称
;;================================================================
;;(abbrev-mode 0) ;0关闭，t开启
;;(define-abbrev-table 'global-abbrev-table '(
;;                                          ("np" ";;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n;;\n;;================================================================\n\n;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX+")
;;                                          ("xin"  "♥")
;;                                          ))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;添加自定义按钮菜单
;;===================================================
;; Creating a new menu pane in the menu bar to the right of “Tools” menu
(define-key-after
  global-map
  [menu-bar zhuifeng]
  (cons "zhuifeng" (make-sparse-keymap "hoot hoot"))
  'tools )

;; Creating a menu item, under the menu by the id “[menu-bar mymenu]”
(define-key
  global-map
  [menu-bar zhuifeng nl]
  '("Next Line" . next-line))

;; creating another menu item
(define-key
  global-map
  [menu-bar zhuifeng pl]
  '("Previous Line" . previous-line))

(define-key global-map [menu-bar zhuifeng vb]'("Visual Basic Mode" .  visual-basic-mode))

;; code to remove the whole menu panel
;; (global-unset-key [menu-bar mymenu])
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;已报废代码
;;================================================================
;;自定义函数-------------添加批注
;;(defun zhushi()
;;  (interactive)
;;  (insert ";;++++++++++++++++++++++++++++++++++++++++++++++++++++++\n;;\n;;++++++++++++++++++++++++++++++++++++++++++++++++++++++")
;;    )
;;(global-set-key (kbd "C-c t") 'zhushi)
;;================================================================
;;录制键盘宏--------------添加批注
;;(fset 'kbdpz
;;   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([59 59 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 return 59 59 return 59 59 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95  return left up] 0 "%d")) arg)))
;;(global-set-key (kbd "C-q") 'kbdpz)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;Org模式相应设置
;;================================================================
(setq org-agenda-files (list "E:/develop/emacs/plan.org"
                             "E:/develop/emacs/question.org"))
                                        ;(setq org-todo-keywords
                                        ;      '((sequence "TODO(t)" "|" "DONE(d)"))) ;增加TODO Item的状态
;;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;;指定以org模式打开.org文件
;;(global-set-key (kbd "<f12>") 'org-agenda)
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cc" 'org-capture)
;;(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time) ;完成时，添加时间戳
(setq org-log-done 'note);完成时，出现一buffer，用来添加心得或备注
(setq org-src-fontify-natively t);org中代码块语法高亮
(setq-default org-use-sub-superscripts nil) ;;针对所有文件  禁用下划线转义
(setq org-structure-template-alist  ;;插入代码块（类似调用yas模板）
      (quote (("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
              ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
              ("vb" "#+begin_src visual-basic\n?\n#+end_src" "<src lang=\"?\">\n\n</src>")
              ("l" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"?\">\n\n</src>")
              )))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;插件扩展原功能----------修改快捷键
;;===================================================
;;(global-set-key (kbd "M-x") 'smex) ;;smex-----命令提示-----helm替代
(global-set-key (kbd "C-s") 'swiper) ;;搜索
(global-set-key (kbd "M-t d") 'youdao-dictionary-search-at-point+);;词典功能
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;recentf mode设置
;;================================================================
(recentf-mode t);打开recentf mode
(setq recentf-max-menu-items 25) ;最多保存25个
(global-set-key (kbd "M-t f") 'recentf-open-files)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;快速切换至上个buffer---------shift+tab
;;================================================================
(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;逗号后自动加空格
;;================================================================
(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                    (insert ", ")))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;拷贝代码自动格式化
;;Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，还可以选中一块代码，
;;按 Ctrl-Alt-\ 对这块代码重新进行格式化.如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\,
;;就可以把新加入的代码格式化好。可是，对于这种粘贴加上重新格式化的机械操作，Emacs 应该可以将
;;它自动化才能配得上它的名气，把下面的代码加到配置文件里，你的 Emacs 就会拥有这种能力了
;;================================================================
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(
                     c-mode
                     c++-mode
                     clojure-mode
                     emacs-lisp-mode
                     haskell-mode
                     js-mode
                     latex-mode
                     lisp-mode
                     objc-mode
                     perl-mode
                     visual-basic-mode
                     cperl-mode
                     plain-tex-mode
                     python-mode
                     rspec-mode
                     ruby-mode
                     scheme-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;增强自带注释功能
;; 当光标位于行尾时，M-; 在行尾进行注释；当光标位于其他位置时，M-; 起到注释该行的作用；当选中一部分区域时，M-; 起到注释该区域的作用
;;===================================================
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;一个简单的办法设置 auto-mode-alist, 免得写很多 add-to-list, 打开文件时运行对应的模式
;;================================================================
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;设置快捷键
;;================================================================
(global-set-key (kbd "C-x x") 'call-last-kbd-macro);;键盘宏的录制和回放
;;(global-sete-key (kbd "M-t d") 'flush-lines);;删除所选区域空白行---失败
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
