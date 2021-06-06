---
layout: post
title:  "Coding Rust ♥ Gnome: rust, gtkrs, flatpak"
categories: technical_stacks
tags: [tech, cheatsheet, rust, gtk, flatpak]
permalink: /coding_rust_gnome/
---
## rust
### toolchain: rust, cargo, rustup
1. cargo, rustc, rustup
```
cargo new help # help
cargo build
cargo run
cargo doc
```
```
rustup show
```

### documents: std, examples
   - rust [std](https://doc.rust-lang.org/std/index.html)
   - rust [examples](https://doc.rust-lang.org/stable/rust-by-example/)

## rust ♥ gnome(gtkrs & flatpak)
### toolchain: meson, ninja, gtkrs(cargo)
[rust gtkrs flatpak template](https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template)

### new project (with template)
```
- git clone https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template.git
- cd gtk-rust-template
- python3 create-project.py
```
### build, install, run, test with meson/ninja
```sh
meson --prefix=/usr/local -Dprofile=development build
ninja -C build
sudo ninja -C build install
ninja -C build run  # or app_name
ninja -C build test # run tests
RUST_LOG=DEBUG ./run_target
```

### documents
1. gtk-rs tutorials, [reference](https://gtk-rs.org/docs-src/), [](examples)
1.  
1. [How to Flatpak a Rust application](https://belmoussaoui.com/article/8-how-to-flatpak-a-rust-application)

#### note:
1. Add run, release, test in meson.build run_target # refer to Tau
1. [env_logger](https://docs.rs/env_logger/0.6.1/env_logger/)
``` env_logger::Builder::from_default_env().init(); ```
1. install meson with pip3
  1.  install pip3 with apt
```
sudo apt-get install python3-pip
```

  1. install the latest meson with pip3
```
su # note: must install meson with root.
pip3 install meson
```

### cargo-gtkrs cmd(imaging)
cargo gtkrs cmd user case
```
cargo install cargo-gtkrs
cargo generate (with examples) # like ignite
cargo gtkrs add switch
cargo gtkrs add searchbar
cargo gtkrs add grid_list
cargo gtkrs add list (snappit: builder ui, signals)
cargo gtkrs add panned_list
```
add pattern with [gnome pattern](https://gitlab.gnome.org/Teams/Design/mockup-resources)

[refer to cargo-script](https://github.com/DanielKeep/cargo-script)
