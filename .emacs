(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(define-key global-map "\C-d" 'delete-backward-char) ; 削除

;;; Localeに合わせた環境の設定
(set-locale-environment nil)

;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)

;;; ツールバーを消す
(tool-bar-mode 0)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 強力な補完機能を使う
;;; p-bでprint-bufferとか
;;(load "complete")
(partial-completion-mode 1)

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; emacs -nw で起動した時にメニューバーを消す
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; 画像ファイルを表示する
(auto-image-file-mode t)

;;; セッションを保存する
;;; 初めは手動でM-x desktop-saveしなければいけない
(desktop-load-default)
(desktop-read)

;;; 自動でファイルを挿入する
(auto-insert-mode t)

;;; 次のGCまでに使用可能なバイト数
(setq gc-cons-threshold 4096000)

;;; 最近使ったファイルを保存(M-x recentf-open-filesで開く)
(recentf-mode)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)