;; 言語を日本語にする
(set-language-environment 'Japanese)

;; Windowsで英数と日本語にMeiryoを指定
;; Macで英数と日本語にRictyを指定
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-face-attribute 'default nil
                             :family "Meiryo"  ;; 英数
                             :height 100)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo")))  ;; 日本語
        ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"  ;; 英数
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))  ;; 日本語

;; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; 行番号フォーマット
(setq linum-format "%3d")

;; 括弧の範囲内を強調表示
(show-paren-mode t)
;(setq show-paren-delay 0)
;(Setq show-paren-style 'expression)

;; 括弧の範囲色
;(set-face-background 'show-paren-match-face "#66cdaa")

;; タブをスペースで扱う
(defun set-aurora-tab-width (num &optional local redraw)
  "タブ幅をセットします。タブ5とかタブ20も設定できたりします。
localが non-nilの場合は、カレントバッファでのみ有効になります。
redrawが non-nilの場合は、Windowを再描画します。"
  (interactive "nTab Width: ")
  (when local
    (make-local-variable 'tab-width)
    (make-local-variable 'tab-stop-list))
  (setq tab-width num)
  (setq tab-stop-list ())
  (while (<= num 256)
    (setq tab-stop-list `(,@tab-stop-list ,num))
    (setq num (+ num tab-width)))
  (when redraw (redraw-display)) tab-width)

(set-aurora-tab-width (setq default-tab-width (setq-default tab-width 2)))
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; auto-indent
(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-m" 'indent-new-comment-line)

;; バックアップを残さない
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;一行コピー
;(defun copy-line (&optional arg)
;  (interactive "p")
;  (copy-region-as-kill
;   (line-beginning-position)
;   (line-beginning-position (1+ (or arg 1))))
;  (message "Line copied")) 
;(define-key global-map "\M-o" 'copy-line)

;;ショートカットコマンドはここで設定可能

;;; キーバインド
;(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
;(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
;(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
;(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
;(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
;(define-key global-map (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
;(define-key global-map (kbd "M-C-g") 'grep)               ; grep
;(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動

;;metaキーをcommandにする
(setq ns-command-modifier (quote meta))

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)
;; 全角空白を表示させる。
(setq jaspace-alternate-jaspace-string "□")
;; タブ記号を表示。
(setq jaspace-highlight-tabs t)

;; 現在行を目立たせる
(global-hl-line-mode)
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)
;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 履歴数を大きくする
(setq history-length 10000)

