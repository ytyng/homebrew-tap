# homebrew-tap

Homebrew tap for ytyng's tools.

```shell
brew tap ytyng/tap
```

## Casks

### ArcVault

Mac archiver that produces zip files without garbled names on Windows.

```shell
brew install --cask ytyng/tap/arcvault
```

### Clipboard Palette

Shows copy-to-clipboard buttons for text piped from standard input. Installs the
`clipboard-palette` command alongside the app.

```shell
brew install --cask ytyng/tap/clipboard-palette
```

### Side by Side Browser

Two-pane browser for comparing before/after migration pages.

```shell
brew install --cask ytyng/tap/side-by-side-browser
```

## How the tap stays current

The tap updates itself. `.github/workflows/update.yml` runs `scripts/update.py`
every hour (and on demand with `gh workflow run update.yml`): for each cask and
formula it reads the GitHub project out of the file, asks for that project's
latest published release, and when the release is newer it downloads the asset,
recomputes the sha256 and rewrites the file. Nothing in the projects pushes here,
so no project needs a token for this repository; a new release reaches the tap
on the next successful hourly run.

A new project is added by writing its cask or formula here by hand once, with the
version and checksum of a release that is already published (a draft can only be
downloaded by its owner). From then on the workflow keeps it moving.

The signed and notarised builds come from each project's own release workflow,
which runs when the version on its `main` branch changes.
