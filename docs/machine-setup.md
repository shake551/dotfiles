# 新しい Mac のセットアップ手順

2026-08 の端末移行で実際に通した手順のメモ。上から順に実行すれば同じ環境が再現できる。
機密情報・業務固有の情報はこのリポジトリに書かないこと（後述の「移行 zip」の中でのみ扱う）。

## 1. Homebrew とパッケージ

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone git@github.com:shake551/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
brew bundle install --file .Brewfile
```

`.Brewfile` に CLI（tmux / neovim / gh / lazygit / nodenv / uv など）と cask（Ghostty / gcloud-cli / Nerd Font）がまとまっている。

Go は Homebrew ではなく公式 pkg（https://go.dev/dl/）で `/usr/local/go` に入れている。入れたら `PATH` に `/usr/local/go/bin` を追加する。

## 2. dotfiles の配置

このリポジトリは `$HOME` のディレクトリ構造をそのまま映している。必要なものをコピー（またはシンボリックリンク）する:

```bash
cd ~/workspace/dotfiles
mkdir -p ~/.config
cp -R .config/nvim ~/.config/nvim
cp -R .config/ghostty ~/.config/ghostty
```

- nvim: 初回起動時に lazy.nvim がプラグインを同期する
- Ghostty: 反映は `cmd+shift+,`（reload_config）。書式チェックは
  `/Applications/Ghostty.app/Contents/MacOS/ghostty +validate-config`

## 3. Git / GitHub

```bash
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)"
# 公開鍵を https://github.com/settings/keys に登録
ssh -T git@github.com        # "Hi <user>!" が出れば OK

gh auth login                # ブラウザ経由
```

## 4. ランタイム類

```bash
# Node（nodenv。node-build は .Brewfile で導入済み）
nodenv install 24.19.0
nodenv global 24.19.0

# Python は uv に寄せる（venv 作成は python3 -m venv でも可）
uv --version
```

## 5. Google Cloud CLI

cask `gcloud-cli` で gcloud / bq / gsutil が入る。認証は 2 段階あるので注意:

```bash
gcloud auth login                       # gcloud / bq コマンド用
gcloud auth application-default login   # ライブラリ・SDK から使う場合のみ（ADC）
gcloud config set project <PROJECT_ID>  # 必要になったら
```

## 6. Claude Code

```bash
# インストール & ログイン（認証は Keychain 管理なので端末ごとに必要）
curl -fsSL https://claude.ai/install.sh | bash
claude   # 初回起動でログイン

# プラグイン
claude plugin install gopls-lsp@claude-plugins-official
claude plugin install typescript-lsp@claude-plugins-official
claude plugin install slack@claude-plugins-official
```

旧端末から引き継ぐもの（後述の移行 zip に含める）:

| パス | 内容 |
|---|---|
| `~/.claude/CLAUDE.md` | グローバル指示 |
| `~/.claude/settings.json` | モデル・statusline・プラグイン等の設定 |
| `~/.claude/skills/` | 自作スキル |
| `~/.claude/projects/` | セッション履歴（`--resume` 用）と**永続メモリ** |
| `~/.claude/history.jsonl` | プロンプト履歴 |
| `~/.claude.json` | プロジェクトの trust・MCP 登録などのアプリ状態 |

注意点:

- `~/.claude/projects/` 配下のディレクトリ名は作業ディレクトリのパスに紐付く。ユーザー名やワークスペースのパスが変わる場合はディレクトリ名をリネームする
- `~/.claude.json` は **Claude Code を全部終了してから**差し替える。セッションが生きていると終了時に書き戻されて上書きされる
- 新端末で既に何度か起動している場合は丸ごと上書きせず、`jq` で新端末側の identity（machineID / userID）を残して `projects` と `githubRepoPaths` だけ旧端末から取り込む方が安全
- `history.jsonl` は両端末で行が増えていたら結合して timestamp でソート・重複排除する

## 7. 旧端末からの移行 zip の作り方

git で運べないローカル状態を 1 つの zip にまとめる方式。構成:

```
migration-YYYYMMDD/
├── RESTORE.md      ← 復元手順と「リポジトリ×ブランチ×未push数×stash数」の一覧表
├── workspace/      ← 作業ディレクトリに重ねる: リポジトリ外のドキュメント、
│                      各リポジトリの未追跡ファイル・gitignore されたローカル設定
├── home/           ← ~/.claude 一式と ~/.claude.json
└── git-extras/     ← zip では運べない git ローカル状態
    └── <repo>/{unpushed.bundle, unpushed-commits.txt, stashes/}
```

収集コマンドの要点（リポジトリごと）:

```bash
# 未追跡ファイルと gitignore されたローカル設定の一覧
git status --porcelain --ignored

# 未 push コミットを bundle 化（push 済みブランチとの差分だけ入る）
git bundle create unpushed.bundle --branches --not --remotes

# stash はパッチとして書き出す（バイナリ・未追跡ファイル込み）
git stash show -p --binary -u "stash@{N}" > stash-N.patch
git stash list > stash-list.txt   # 作成元ブランチの記録
```

復元側の要点:

```bash
# リポジトリを clone してブランチを合わせたあと
git bundle verify unpushed.bundle
git fetch unpushed.bundle 'refs/heads/*:refs/heads/*'

# stash は必要になったものだけ当てる
git apply --3way stash-N.patch    # 衝突したら --reject + .rej 手当て
```

ハマりどころ（今回踏んだもの）:

- **tracked かつローカル変更ありのファイル**を workspace/ に含めると、復元時のコピーで clone 直後の内容を上書きする。RESTORE.md に明示しておき、復元時に個別判断する
- 旧端末で checkout していた feature ブランチは、マージ後に remote から消えていることがある。未 push コミットが 0 なら消失はないので、RESTORE.md の一覧表で「未 push 数」を残しておくと復元時に切り分けられる
- zip には env ファイル等の機密が入る。**暗号化した経路で移送し、移行が終わったら旧端末側ともに削除する**
- venv / node_modules / ビルド成果物は入れない（README の手順で再生成）

## 8. 最後に確認するもの

- [ ] `git commit` が署名・メールアドレスの設定込みで通る（`git config user.email` など）
- [ ] tmux が起動する（`tmux -V`）
- [ ] nvim を開いてプラグインが同期される
- [ ] `claude` が旧端末のメモリ・スキルを認識している
- [ ] 移行 zip を旧端末・新端末の両方から削除した
