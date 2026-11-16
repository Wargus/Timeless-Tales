# Releasing Timeless Tales

Timeless Tales is released in lockstep with the Stratagus engine: a release of
version `X.Y.Z` is tagged `vX.Y.Z` here and in
[`Wargus/stratagus`](https://github.com/Wargus/stratagus), and the workflows
here build against the engine tag with the matching name, falling back to the
engine `master` branch when there is no such tag. Tag the engine first, so
that the artifacts built here ship the engine that is being released.

The game is only data, so there is nothing to compile here: the artifacts are
the engine plus this repository's tree and a launcher that runs the engine
with `-d` pointed at it.

1. Increase the version in:

   |file| |
   |---|---|
   |`scripts/stratagus.lua`|`wargus.Version`, which the game shows in the UI|
   |`timeless-tales.nsi`   |`VERSION` of the installer, and its `COPYRIGHT` years|
   |`mac/Info.plist`       |`CFBundleShortVersionString` and `CFBundleVersion` of the app bundle|

2. Commit and merge to `master`: `git commit -a -m "Release version X.Y.Z"`.

3. Once the engine has been tagged `vX.Y.Z`, tag and push here. The CI builds
   the artifacts and puts them on the release.

   ```sh
   git tag vX.Y.Z
   git push origin master --tags
   ```

   With the artifacts up, write the notes for the release, e.g. with
   `gh release edit vX.Y.Z --verify-tag --notes-file notes.md`.

4. Update the download links for the stable versions in the website
   repository.
