;;; leef-packages.el --- Emacs Prelude: default package selection.
;;

;;; Commentary:

;; Takes care of the automatic installation of all the packages required by
;; leef

;;; Code:
(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; set package-user-dir to be relative to Prelude install path
(setq package-user-dir (expand-file-name "elpa" prelude-dir))
(package-initialize)

(defvar leef-packages
  '(auto-complete ecb go-autocomplete go-mode fullscreen-mode flymake-ruby flymake-cursor puppet-mode mustache-mode)
  "A list of packages to ensure are installed at launch.")

(defun leef-packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (every #'package-installed-p leef-packages))

(defun leef-install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (leef-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (mapc #'package-install
     (remove-if #'package-installed-p leef-packages))))

(leef-install-packages)

(provide 'prelude-packages)
;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; leef-packages.el ends here
