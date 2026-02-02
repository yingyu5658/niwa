;;; publish.el
;;; export notes to html
;;;-*- lexical-binding: t; -*-
;;
;; Copyright (C) 2026 Verdant
;;
;; Author: Verdant <i@glowisleme>
;; Maintainer: Verdant <i@glowisle.me>
;; Created: February 02, 2026
;; Modified: February 02, 2026
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Code:

(require 'ox-html)
(require 'org)

(setq org-publish-project-alist
      '(("niwa-notes"
         :base-directory "~/niwa/notes"
         :base-extension "org"
         :recursive t
         :publishing-directory "~/niwa/public"
         :publishing-function org-html-publish-to-html
         :with-author nil
         :with-creator nil
         :section-numbers nil)

         ("niwa"
          :components ("niwa-notes"))))

(provide 'publish)

;;; publish.el ends here
