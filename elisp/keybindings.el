; In order to keep my init.el file more organized,
; I'm keeping my keybindings in this file
; and using load-file in init.el on this file

; map "newline-and-indent" to the ENTER key so that I can always indent without issue. Let shift-RET due what RET used to do. Leave C-j empty
(global-set-key [?\r] 'newline-and-indent)
(global-set-key [(S-return)] 'newline)
(global-unset-key [(control ?j)])

; Turns out that C-o runs open-line. I think this would be more intuitive to run from <some modifier>-RET.
(global-unset-key [(control ?o)])
(global-set-key [(C-return)] 'open-line)

; Make switching buffers like switching tabs in a browser with C-Tab.
; These functions are still bounded to other key combinations that I'm highly unlikely to uses. 
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-buffer)


; Disable the suspend-frame command (minimize emcs) only if in a GUI environment.
; from http://stackoverflow.com/questions/28202546/hitting-ctrl-z-in-emacs-freezes-everything
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-z") 'my-suspend-frame)

(defun my-suspend-frame ()
  "In a GUI environment, do nothing; otherwise `suspend-frame'."
  (interactive)
  (if (display-graphic-p)
      (message "suspend-frame is disabled for graphical displays.")
    (suspend-frame)))
