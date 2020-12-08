## gtk rust template tips

[rust ♥ gnome(gtk & flatpak) template](https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template)
- A boilerplate template to get started with GTK, Rust(**gtk_rs**), **Meson/ninja**, **Flatpak** made for GNOME. It can be adapted for other desktop environments like elementary.
- git clone https://gitlab.gnome.org/bilelmoussaoui/gtk-rust-template.git
- cd gtk-rust-template
- python3 create-project.py

[How to Flatpak a Rust application](https://belmoussaoui.com/article/8-how-to-flatpak-a-rust-application)

### build, install, run, test with meson/ninja
```sh
meson --prefix=/usr/local -Dprofile=development build
ninja -C build
sudo ninja -C build install
ninja -C build run  # or app_name
ninja -C build test # run tests
RUST_LOG=DEBUG ./run_target
```

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
