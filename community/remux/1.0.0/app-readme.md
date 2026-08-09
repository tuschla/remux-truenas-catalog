# Remux

[Remux](https://github.com/lostb1t/remux) is a self-hosted media server with a Jellyfin-compatible API. It brings Stremio add-ons, local files, WebDAV sources, and torrents together under one roof, and works with any Jellyfin client without changes.

## Installation

Create a new Remux application and follow the setup wizard.

## Configuration

- **Web UI / API Port**: The NodePort used to reach the Remux web UI and Jellyfin-compatible API.
- **Timezone**: Timezone for the Remux container.
- **Data Storage**: Persistent storage mounted at `/data` (SQLite database, logs, torrents, and transcode scratch). Defaults to an ixVolume.
- **Resources**: CPU and memory limits. Remux transcodes with the bundled Jellyfin ffmpeg; software transcoding of 1080p content benefits from ~4 CPU cores.

## Usage

1. Open the web UI via the portal button (or `http://<node-ip>:<web-port>`).
2. In the dashboard, add your Stremio add-on manifests (for example a self-hosted [AIOStreams](https://github.com/Viren070/AIOStreams) instance) and build libraries.
3. Connect any Jellyfin-compatible client (Jellyfin for webOS, Swiftfin, Infuse, Jellyfin for Android, etc.) to `http://<node-ip>:<web-port>`.

## Notes

- The app runs as root.
- Transcoding uses the bundled Jellyfin ffmpeg; hardware acceleration requires passing a GPU to the container.
