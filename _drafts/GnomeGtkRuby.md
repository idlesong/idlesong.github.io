# gtk structure like rails
## gir_ffi
## xml builder
## libxml ruby; 通过 erb template 生成 xml
## database?
## 充分利用gem机制，将command line的海量工具作为gem，移植GUI界面 到gnome

# ruby-gnome2，利用github同步，并可更改，类似python的网页

## 类比
0. server => ruby api
1. html => xml (xml builder:glade)
2. js   => ruby(GObject.signal_connect button, "clicked", "button 1", &callback)
3. css?

## glade => xml
- command: gtk-builder-convert tutorial.glade tutorial.xml
- Note: <interface> => <glade-interface> in tutorial.glade
