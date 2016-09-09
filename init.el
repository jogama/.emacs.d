;; Disable the menu bar, toolbar, and scrollbar, because I use none of them.
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Open .h files in c++ mode (from stackoverflow)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Save emacs sessions automatically 
(desktop-save-mode 1)

;; Enable Julia mode
(add-to-list 'load-path "/home/jogama/.emacs.d/elisp")
(require 'julia-mode)

;; Haskell things. Had to choose between the three indentation options;;  I chose the simplest one.
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-mode.el")
   ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
   ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Disable the splash screen. This is mainly for when I use emacs in terminal (I use desktop ottherwise)
(setq inhibit-splash-screen t) ;; to enable aga

;; All my own keybindings are here
(load-file "~/.emacs.d/elisp/keybindings.el")

;; Visual line mode is pretty
(global-visual-line-mode 1)

;; I always use *scratch* for human text
(setq initial-major-mode 'text-mode)


;; LaTeX things. (I'm using the gnu auctex package) Retrieved mostly from here: http://piotrkazmierczak.com/2010/05/13/emacs-as-the-ultimate-latex-editor/
(setq TeX-auto-save t)
(setq Tex-parse-self t)
(setq Tex-save-query nil)
(setq Tex-PDF-mode t)
(load "preview-latex.el" nil t t) ;; so that I may preview my latex docs.
(require 'flymake) ;; flymake hasn't been working.

;; (defun flymake-get-tex-args (file-name)
;; (list "pdflatex"
;; (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)

(setq ispell-program-name "aspell") ;;  could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ;;  this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;; Enable installation of packages from MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; For the Emacs Code Browser (ECB) to work.
;; Followed https://www.logilab.org/blogentry/173886 as much as I could. 
(add-to-list 'load-path "/home/jogama/.emacs.d/elisp/ecb-alexott/")
;; (require 'ecb)
(require 'ecb-autoloads) ; This might break... if it does, switch to (require 'ecb).
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes (quote ("d12c2cae6c13a834084e06a3062d5a27cac7627e0872bd1728d203b46ae6a5bb" default)))
 '(ecb-options-version "2.40")
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; I want elpy to use all the binaries it needs, but some are in ~/.local/bin
(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

;; I sometimes use a spanish keyboard. 
(require 'iso-transl)

;; for MOOS-IvP
(add-to-list 'load-path "~/code/moos-ivp/editor-modes/")
(require 'moos-mode)
(add-to-list 'auto-mode-alist '("\\.moos\\'" . moos-mode))

;; I want my C++ style to match that of the code I'm working with, not the GNU style
;; (defun my-c++-mode-hook ()
;; ;  (setq c-default-style "stroustrup" c-basic-offset 2)
;;   (c-set-offset 'access-label -1))
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)
