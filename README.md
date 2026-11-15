![Build Status](https://github.com/Wargus/Timeless-Tales/actions/workflows/build.yml/badge.svg)

[![Join the chat at https://gitter.im/Wargus](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/Wargus?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Discord](https://img.shields.io/discord/780082494447288340?style=flat-square&logo=discord&label=discord)](https://discord.gg/dQGxaw3QfB)

# Timeless Tales

A free fantasy real time strategy game for the
[Stratagus](https://github.com/Wargus/stratagus) engine, a continuation of
the Aleona's Tales campaign.

The game is only data: it needs a Stratagus engine to play it, and the
releases below come with one bundled.

### Downloads

Every release of Timeless Tales comes with a Windows installer, a macOS `dmg`
and a Linux AppImage:

- [Latest stable release](https://github.com/Wargus/Timeless-Tales/releases/latest)
- [Latest unstable build](https://github.com/Wargus/Timeless-Tales/releases/tag/master-builds)

## Playing without a bundle

Point a Stratagus engine at a checkout of this repository:

```sh
git clone https://github.com/Wargus/Timeless-Tales
stratagus -d Timeless-Tales
```

## Releasing

See [RELEASING.md](RELEASING.md).
