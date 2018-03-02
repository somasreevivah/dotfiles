(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'pdf-tools)
(require-package 'evil)
(require-package 'ledger-mode)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(defun my-evil-doc-view-hook ()
  (turn-off-evil-mode)
  (define-key doc-view-mode-map (kbd "j") 'doc-view-scroll-up-or-next-page)
  (define-key doc-view-mode-map (kbd "k") 'doc-view-scroll-down-or-previous-page)
  (define-key doc-view-mode-map (kbd "h") 'image-backward-hscroll)
  (define-key doc-view-mode-map (kbd "l") 'image-forward-hscroll))
(add-hook 'doc-view-mode-hook 'my-evil-doc-view-hook)
