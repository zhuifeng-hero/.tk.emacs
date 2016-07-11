(defun add-subdirs-to-load-path (dir)
  "Recursiv2016/7/9 18:05:57 `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.tk.emacs/.tk.selfdev/")
(add-subdirs-to-load-path "~/.tk.emacs/.tk.packages/")
