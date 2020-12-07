## gtk rust template tips

[gtk rust template](https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template)
- A boilerplate template to get started with GTK, Rust(**gtk_rs**), **Meson/ninja**, **Flatpak** made for GNOME. It can be adapted for other desktop environments like elementary.
- git clone https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template.git
- cd gtk-rust-template
- python3 create-project.py

[How to Flatpak a Rust application](https://belmoussaoui.com/article/8-how-to-flatpak-a-rust-application)


### install meson with pip3
1.  install pip3 with apt
```
sudo apt-get install python3-pip
```

1. install the latest meson with pip3
   - note: must install meson with root.
```
su
pip3 install meson
```

### build, install, run, test with meson/ninja
```sh
meson --prefix=/usr/local -Dprofile=development build
ninja -C build
sudo ninja -C build install
```

During development you can quickly test Tau with the following command:

```sh
ninja -C build run
```
or
```
app_name
```

You can run tests with:

```sh
ninja -C build test
```

extra: add run, release, test in meson.build
```
run_target(
  'release',
  command: ['scripts/release.sh', meson.project_name(), meson.project_version()]
)

run_target(
  'run',
  command: 'scripts/run.sh',
  depends: tau,
)

test(
  'cargo test --all',
  cargo,
  args: 'test',
  timeout: 3000,
)


### rust log
[env_logger](https://docs.rs/env_logger/0.6.1/env_logger/)
env_logger::Builder::from_default_env().init();

RUST_LOG=DEBUG ./main

### others
diff &Application, Application;
