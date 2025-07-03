(require 'org)

(let ((vc-follow-symlinks nil))
  (if (file-newer-than-file-p "~/.emacs.d/init.org" "~/.emacs.d/init.el")
      (org-babel-tangle-file "~/.emacs.d/init.org")))

(load-file "~/.emacs.d/init.el")
