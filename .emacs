;; パスを通す
(setq load-path (cons "~/.emacs.d/elisp" load-path))


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

(setq transpose-chars nil)


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

(setq desktop-files-not-to-save "\\(^/[^/:]*:\\|\\.diary$\\)")
(autoload 'desktop-save "desktop" nil t)
(autoload 'desktop-clear "desktop" nil t)
(autoload 'desktop-load-default "desktop" nil t)

;;; セッションを保存する
;;; 初めは手動でM-x desktop-saveしなければいけない
(desktop-load-default)
(autoload 'desktop-remove "desktop" nil t)
(desktop-read)
(add-hook 'kill-emacs-hook 'desktop-save-in-desktop-dir)

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

;; シンボリックリンクのファイル開くたびに聞かれるためむかつくから消す
(setq vc-follow-symlinks t)

;; 文字の色を設定します。
(add-to-list 'default-frame-alist '(foreground-color . "black"))
;; 背景色を設定します。
(add-to-list 'default-frame-alist '(background-color . "white"))
;; カーソルの色を設定します。
(add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
;; マウスポインタの色を設定します。
(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
;; モードラインの文字の色を設定します。
(set-face-foreground 'modeline "white")
;; モードラインの背景色を設定します。
(set-face-background 'modeline "MediumPurple2")
;; 選択中のリージョンの色を設定します。
(set-face-background 'region "LightSteelBlue1")
;; モードライン（アクティブでないバッファ）の文字色を設定します。
(set-face-foreground 'mode-line-inactive "gray30")
;; モードライン（アクティブでないバッファ）の背景色を設定します。
(set-face-background 'mode-line-inactive "gray85")


;; elispのインストールを簡単に
(require 'install-elisp)
(setq install-elisp-repository-directory "~/dotfiles/.emacs.d/elisp/")

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; auto-complete
;; 補完候補を自動ポップアップ
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-modes (cons 'js-mode ac-modes))

;; タブとか
(setq js-indent-level 4)


;; gtagsの設定
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
))

(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

(add-hook 'php-mode-common-hook
          '(lambda ()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

;; (2) And put the following in your ~/.emacs startup file:
(require 'auto-install)
;; (3) Add this to your ~/.emacs to optionally specify a download directory:
(setq auto-install-directory "~/.emacs.d/elisp/")
;; (4) Optionally, if your computer is always connected Internet when Emacs start up,
;;     I recommend you add below to your ~/.emacs, to update package name when start up:
(auto-install-update-emacswiki-package-name t)
;;     And above setup is not necessary, because AutoInstall will automatically update-emacswiki-package-name;;     package name when you just first call `auto-install-from-emacswiki',
;;     above setup just avoid *delay* when you first call `auto-install-from-emacswiki'.d/elisp;;
;; (5) I recommend you add below to your ~/.emacs for install-elisp users:
(auto-install-compatibility-setup)

(require 'anything)

;;(autoload 'js2-mode "js2-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))




