byteorder
=========
Fork of [byteorder](https://github.com/BurntSushi/byteorder) that enables runtime ByteOrder handling. 

[![Build status](https://github.com/acovaci/orderbyte/workflows/ci/badge.svg)](https://github.com/acovaci/orderbyte/actions)
[![crates.io](https://img.shields.io/crates/v/orderbyte.svg)](https://crates.io/crates/orderbyte)

This crate is licensed under the [MIT license](LICENSE).


### Reasoning

The original crate does not allow for runtime ByteOrder handling. There have
been multiple requests for this feature, and I have myself reimplemented it
multiple times. This fork aims to provide a single implementation that can be
reused if needed.

I won't encourage using this fork over the original crate, unless this feature
is required. The original crate is well maintained and its author is very
knoowledgeable in Rust, while I am a beginner. Feel free to submit any issues
or PRs, if there are any bugs or use cases that are not covered, however, be
aware that this fork will handle only issues related to runtime handling. If
there are any other features you need, I would encourage you to fork this
further, and maintain it yourself. I will gladly pass on the ownership if
a better project comes along, or if the original crate implements this
feature.

### Installation

This crate works with Cargo and is on
[crates.io](https://crates.io/crates/orderbyte). Add it to your `Cargo.toml`
like so:

```toml
[dependencies]
orderbyte = "0.0.1"
```

If you want to augment existing `Read` and `Write` traits, then import the
extension methods like so:

```rust
use orderbyte::{ReadBytesExt, WriteBytesExt, BigEndian, LittleEndian};
```

For example:

```rust
use std::io::Cursor;
use orderbyte::{BigEndian, ReadBytesExt};

let mut rdr = Cursor::new(vec![2, 5, 3, 0]);
// Note that we use type parameters to indicate which kind of byte order
// we want!
assert_eq!(517, rdr.read_u16::<BigEndian>().unwrap());
assert_eq!(768, rdr.read_u16::<BigEndian>().unwrap());
```

### `no_std` crates

This crate has a feature, `std`, that is enabled by default. To use this crate
in a `no_std` context, add the following to your `Cargo.toml`:

```toml
[dependencies]
orderbyte = { version = "0.0.1", default-features = false }
```

### Alternatives

Of course, the original crate works perfectly well, and you should use it if
you don't need runtime ByteOrder handling.

Another alternative is the [endian](https://crates.io/endian) crate, which was
designed with this feature in mind. 

Note that as of Rust 1.32, the standard numeric types provide built-in methods
like `to_le_bytes` and `from_le_bytes`, which support some of the same use
cases.

### Acknowledgements

This crate was originally written by [BurntSushi](https://github.com/BurntSushi).
