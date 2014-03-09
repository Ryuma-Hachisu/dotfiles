;;; less-css-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (less-css-mode less-css-compile) "less-css-mode"
;;;;;;  "../../../../../.emacs.d/elisp/elpa/less-css-mode-20140205.250/less-css-mode.el"
;;;;;;  "2b47008bd75f34b58e8306362c5dee94")
;;; Generated autoloads from ../../../../../.emacs.d/elisp/elpa/less-css-mode-20140205.250/less-css-mode.el

(autoload 'less-css-compile "less-css-mode" "\
Compiles the current buffer to css using `less-css-lessc-command'.

\(fn)" t nil)

(autoload 'less-css-mode "less-css-mode" "\
Major mode for editing LESS files, http://lesscss.org/
Special commands:
\\{less-css-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elisp/elpa/less-css-mode-20140205.250/less-css-mode-pkg.el"
;;;;;;  "../../../../../.emacs.d/elisp/elpa/less-css-mode-20140205.250/less-css-mode.el")
;;;;;;  (21276 31467 536477 0))

;;;***

(provide 'less-css-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; less-css-mode-autoloads.el ends here
