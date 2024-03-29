# tagmusic

Automatically tag music files on a remote sftp drive.

The script mounts your network drive, uses [onetagger-cli](https://github.com/Marekkon5/onetagger) to tag all your music and unmounts your drive again.

## Installation

### 1. Dependencies

- bash
- sshfs
- onetagger

### 2. Download

```bash
git clone --depth=1 https://github.com/chrisinick/tag-music.git
cd tag-music
chmod u+x tagmusic
```

Add tagmusic to PATH to use it from anywhere in the shell.

### 3. Setup

Paste your Spotify ID and secret into tagmusic_config.json to let One Tagger access Spotify for tagging.

```json
  "spotify": {
    "clientId": "",
    "clientSecret": ""
  },
```

## Usage

### Start tagging

```bash
tagmusic user@host:/path/to/music/directory
```

## Resource

[One Tagger](https://onetagger.github.io/)

## License

Licensed under the [GPLv3](https://github.com/chrisinick/tag-music/blob/master/LICENSE.txt) License.

