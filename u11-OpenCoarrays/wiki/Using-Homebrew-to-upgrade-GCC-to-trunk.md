To upgrade GCC to the latest trunk version using Homebrew, try the following command:

```
brew upgrade --fetch-HEAD --HEAD gcc
```

Note that now your default GCC will be the trunk version. If you wish to switch back to the latest stable version you had installed it will look like

```
brew switch gcc 7.2.0
```

Switching back to the latest trunk would be

```
brew switch gcc HEAD-<sha>
```

where `<sha>` is the abbreviated SHA of the trunk version you want. For me `<sha>` is `252768`. If you are already on the HEAD/trunk gcc branch and you want to upgrade to the most recent HEAD/trunk, the command first listed above should also do the trick:

```
brew upgrade --fetch-HEAD --HEAD gcc
```

Without `--fetch-HEAD` Homebrew won't go look for a newer version of HEAD/trunk.

You may want to delete some older HEAD/trunk versions. The best bet to do this is probably doing it manually. `brew --cellar gcc` will show you the top level gcc directory under which all the latest stable releases and HEAD/trunk builds are installed. Simply `rm -rf HEAD-<sha>` corresponding to the old HEAD/trunk installation you want to remove.

If you accidentally delete a version of gcc while it's still linked (you didn't run `brew switch gcc <version>`) you can run `brew prune` to remove empty directories and dead symbolic links in `/usr/local`

If you want to install an older version of gcc try the following:

```
brew tap homebrew/versions
brew install gcc@<maj-rev>
```

Where `<maj-rev>` is `5` or `6`. (For older GCCs in the 4.x branch there may be a few available i.e. `4.9`, `4.8` etc. Try `brew search gcc` after you ran `brew tap homebrew/versions`.) Other major versions installed with the `@<maj-rev>` syntax are installed in parallel and have the `-<maj-rev>` suffix on all the installed binaries, so no `brew switch gcc ...` is required.