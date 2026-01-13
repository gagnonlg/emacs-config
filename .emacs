(require 'org)

(setq default-init-path "~/.emacs.d/init.org") ;; FIXME(?)
(setq alt-init-path-env-var "EMACSINIT")

;; TODO for the org code path, figure out the target name and
;; check if we really need to tangle

;; TODO add support for native compilation

(let ((vc-follow-symlinks nil)
      (init-file (or (getenv alt-init-path-env-var)
		     default-init-path)))
  (pcase (file-name-extension init-file)
    ;; .el: load directly
    ("el"  (load-file init-file))
    ;; .org: tangle to tmp file then load
    ("org" (mapcar #'load-file (org-babel-tangle-file init-file)))
    (_     (error   ":("))))
