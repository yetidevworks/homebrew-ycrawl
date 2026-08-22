# homebrew-ycrawl

Homebrew tap for [ycrawl](https://github.com/yetidevworks/ycrawl).

```bash
brew install yetidevworks/ycrawl/ycrawl
```

Naming the tap in full is deliberate. Homebrew 6 refuses to load formulae from
untrusted taps, and a fully-qualified name counts as consent, so this needs no
`brew trust` step. Tapping first and then installing by the bare name does not.

The formula is updated automatically by ycrawl's release workflow. Do not edit `Formula/ycrawl.rb` by hand.
