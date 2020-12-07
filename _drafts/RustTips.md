## rust tips

rustup show

cargo new help


### cargo-gtkrs
cargo install cargo-script
cargo install --force cargo-script

$ echo 'fn main() { println!("Hello, World!"); }' > hello.rs
$ cargo script hello.rs
Hello, World!
$ cargo script hello # you can leave off the file extension
Hello, World!

https://github.com/DanielKeep/cargo-script

```
cargo gtkrs new (with examples)
cargo gtkrs add switch
cargo gtkrs add searchbar
cargo gtkrs add grid_list
cargo gtkrs add list
cargo gtkrs add panned_list
```
[gnome pattern](https://gitlab.gnome.org/Teams/Design/mockup-resources)
