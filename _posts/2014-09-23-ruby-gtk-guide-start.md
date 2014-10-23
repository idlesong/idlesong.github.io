---
layout: post
title:  "guide-start"
categories: jekyll update
---
# ruby-gnome 2.2.0 ruby-gtk guide
## Get started!

### Introduction
#### About GTK


GTK (GIMP Toolkit) is a library for creating graphical user interfaces. It is licensed using the LGPL license, so you can develop open software, free software, or even commercial non-free software using GTK without having to spend anything for licenses or royalties.

It's called the GIMP toolkit because it was originally written for developing the GNU Image Manipulation Program (GIMP), but GTK has now been used in a large number of software projects, including the GNU Network Object Model Environment (GNOME) project. GTK is built on top of GDK (GIMP Drawing Kit) which is basically a wrapper around the low-level functions for accessing the underlying windowing functions (Xlib in the case of the X windows system), and gdk-pixbuf, a library for client-side image manipulation.
(from GTK Tutorial)


GTK is essentially an object oriented application programmers interface (API). Although written completely in C, it is implemented using the idea of classes and callback functions (pointers to functions).

There is also a third component called GLib which contains a few replacements for some standard calls, as well as some additional functions for handling linked lists, etc. The replacement functions are used to increase GTK's portability, as some of the functions implemented here are not available or are nonstandard on other Unixes such as g_strerror(). Some also contain enhancements to the libc versions, such as g_malloc() that has enhanced debugging utilities.

In version 2.0, GLib has picked up the type system which forms the foundation for GTK's class hierarchy, the signal system which is used throughout GTK, a thread API which abstracts the different native thread APIs of the various platforms and a facility for loading modules.

As the last component, GTK uses the Pango library for internationalized text output.

#### About Ruby-GNOME2

(according to the Ruby-GNOME2 Tutorial)

Ruby is "the interpreted scripting language for quick and easy object-oriented programing". It has a simple syntax exception handling features to make it easy to handle errors. The operators are syntax sugar for methods, as you can redefine them easily. Ruby is a true OOL. This means that everything in Ruby is an object. Ruby is also cross platform, and will run on many types of UNIX, DOS, Windows, Mac, etc.

The primary author of Ruby is:

-    Yukihiro Matsumoto (Matz)

Ruby-GNOME2 is a binding for the Ruby language to use the GTK library, as well as some of the GNOME libraries. Ruby-GNOME2 provides a way to create a GUI frontend for anything you can write in Ruby.

The primary authors of Ruby-GNOME2 are:

-    Masahiro Sakai
-    Masao Mutoh
-    Takehiro Kubo

#### About this tutorial

GTK is accessible through several programming languages, such as C++, Guile, Perl, Python, TOM, Ada95, Objective C, Free Pascal, Eiffel, Java, and C#. This document covers Ruby/GTK2, the Ruby binding for the GTK library version 2.

The reader should have some Ruby knowledge. It would be better if he/she has some experience on X programming, but this is not required.

This document is still under construction. Do not hesitate to send comments or ask questions to the mailing list. Any feedback will be greatly appreciated.

### First Start
Obviously, you need to install Ruby-GNOME2 on your machine. Please consult one of our Install Guide. If your system is not yet covered, just download manually the latest package from SourceForge, decompress the tarball and read the README file for further instructions.

(More recently, installation process has been significantly improved - see the Installation documentation).

To begin our introduction to GTK, we'll start with the simplest program possible. This program will create a 200x200 pixel window and has no way of exiting except to be killed by using the shell:

``` ruby
require 'gtk2'
window = Gtk::Window.new
window.show
Gtk.main
```
Save this program in a file named base.rb, and call it with:

``` ruby
ruby base.rb
```
We will comment now each step of the program.

The first line links the Ruby/GTK2 library in the program.

```ruby
require 'gtk2'
```
The second line uses Gtk::Window.new to create a new GTK window with default parameters, as follows:
- size: 200x200
- style: Gtk::Window::TOPLEVEL
- style: Gtk::Window::POPUP ( does not work)
- title: same as your program name (here: base.rb)


```ruby
window = Gtk::Window.new
```


The third line calls Gtk::Window#show to display the window we just created:

```ruby
window.show
```
The last line enters the GTK main processing loop:

```ruby
Gtk.main
```
Gtk.main is another call you will see in every Ruby/GTK2 application. When control reaches this point, GTK will sleep waiting for X events (such as button or key presses), timeouts, or file IO notifications to occur. In our simple example, however, events are ignored.
##### Note about the section Caveat

Ideally all the features available in original C language GTK library should be found also in Ruby, however, where it does not make sense or is not absolutely necessary, they were omitted. For completion I'd like to point out to such omissions or any other relevant differences in the section, under the heading Caveat.

##### Caveat

As you've seen window type (style) can be either Gtk::Window::TOPLEVEL or Gtk::Window::POPUP. While you have some control of the size and placement of top-level windows on the display, the top-level window is ultimately controlled by window manager. However, the pop-up window is different. They are normally used for things that are often not considered windows, such tooltips and menus. They are ignored by the window manager, and therefor have no decorations or border frame. In Ruby the second POPUP style is mostly ignored, hence, there really is only one style of window to be considered, namely the default Gtk::Window::TOPLEVEL.

This may be the reason that Window instance methods that allow querying and setting Window type/style (Gtk::Window::type, ...) at the time of this writing are not supported, though you will find them in the documentation.

In particular, do not use Gtk::Window::POPUP just to turn off the window borders; use Gtk::Window#decorated= for that:

```ruby
window = Gtk::Window.new(type = Gtk::Window::TOPLEVEL)
window.decorated = false
```
## Hello World!
Here is a typical "Hello World" style program for Ruby/GTK2.

This program is also available in the file "gtk/sample/misc/helloworld.rb" in the ruby-gnome2 package.
```ruby
#!/usr/bin/env ruby
=begin
  helloworld.rb - Ruby/GTK first sample script.

  Copyright (c) 2002,2003 Ruby-GNOME2 Project Team
  This program is licenced under the same licence as Ruby-GNOME2.

  $Id: helloworld.rb,v 1.4 2003/02/01 16:46:22 mutoh Exp $
=end

require 'gtk2'

button = Gtk::Button.new("Hello World")
button.signal_connect("clicked") {
  puts "Hello World"
}

window = Gtk::Window.new
window.signal_connect("delete_event") {
  puts "delete event occurred"
  #true
  false
}

window.signal_connect("destroy") {
  puts "destroy event occurred"
  Gtk.main_quit
}

window.border_width = 10
window.add(button)
window.show_all

Gtk.main
```

## Mechanism of signals and callbacks

Before looking at the "Hello World" program in details, we should study a bit
how GTK handles signals and callbacks.

In the same way as your system delivers a signal to processes upon shutdown 1,
GTK sends a signal to the main loop (Gtk.main) when a special event occured.
The main loop will therefore call back the appropriate function of the widget.

Until a signal is received, the main loop will sleep.

In order to tell a GTK widget that it has to catch a specific signal, and then
execute appropriate code, we need to set a signal handler.

This can be done with the GLib::Instantiatable#signal_connect method, which is
part of the Ruby/GLib library (do not forget that GTK is built on GLib):

```ruby
GLib::Instantiatable#signal_connect("signal name") do
    # Code to execute when "signal name" is caught.
end

GLib::Instantiatable#signal_connect needs 2 things:
-    the name of the signal which will be caught;
-    a block code that will be executed upon reception of the given signal.

The block code can take an optional parameter as follows:

GLib::Instantiatable#signal_connect("signal name") do |w|
    # ...
end
```
The widget which issues the signal will be therefore substituted by the parameter w.


## Events
In addition to the above signal mechanism, events from the X Window Server are also reflected in GTK.

Here is an exhaustive list of catchable events:

#### event
-    button_press_event
-    button_release_event
-    scroll_event
-    motion_notify_event
-    delete_event
-    destroy_event
-    expose_event
-    key_press_event
-    key_release_event
-    enter_notify_event
-    leave_notify_event
-    configure_event
-    focus_in_event
-    focus_out_event
-    map_event
-    unmap_event
-    property_notify_event
-    selection_clear_event
-    selection_request_event
-    selection_notify_event
-    proximity_in_event
-    proximity_out_event
-    visibility_notify_event
-    client_event
-    no_expose_event
-    window_state_event

You can connect some code to a specific X11 event exactly in the same way as we saw previously with GTK signals. Just provide one of the above mentioned "event name" instead of "signal name":

``` ruby
GLib::Instantiatable#signal_connect("event name") do
    # Code to execute upon reception of "event name".
end
```

The callback code can accept 2 parameters, as follows:
``` ruby
GLib::Instantiatable#signal_connect("event name") do |w, e|
    # ...
end
```
(in this case, w will refer the widget, and e the event).

Depending of the return value of the block code, GTK will decide if the event should be spread or not:

-    if true, GTK will stop the event processing here;
-    if false, GTK will continue to propagate the event [xxx explain more]

Also, GDK selections and drag-and-drop issue several events, but these are reflected by GTK signals:

-    selection_received
-    selection_get
-    drag_begin_event
-    drag_end_event
-    drag_data_delete
-    drag_motion
-    drag_drop
-    drag_data_get
-    drag_data_received

### More on Signals Handlers

Let's take another look at GLib::Instantiatable#signal_connect:
``` ruby
% irb --simple-prompt
>> require 'gtk2'
=> true
>> b = Gtk::Button.new("hoge")
=> #<Gtk::Button:0x40a2a858 ptr=0x8237df8>
>> b.signal_connect("clicked") { puts 1 }
=> 1
>> b.signal_connect("clicked") { puts 2 }
=> 2
>>
```
Notice the returned integer value?

This is a tag that identifies your callback block. As stated above, you may have as many callbacks per signal and per object as you need, and each will be executed in turn, in the order they were attached.

Now, we are going to manually emit a signal. The GLib::Instantiatable#signal_emit method will post the specified signal name passed as its argument.

You can observe here that our blocks are called in the order of their installation:
``` ruby
>> b.signal_emit("clicked")
1
2
=> nil
>>
```

GLib::Instantiatable#signal_handler_disconnect is used to remove a previously installed signal handler, identified by the tag returned by GLib::Instantiatable#signal_connect:

``` ruby
>> b.signal_handler_disconnect 1
=> #<Gtk::Button:0x40a2a858 ptr=0x8237df8>
>> b.signal_emit("clicked")
2
=> nil
>>
```

You can also temporarily disable a callback block code with GLib::Instantiatable#signal_handler_block and GLib::Instantiatable#signal_handler_unblock:
``` ruby
>> b.signal_handler_block 2
=> #<Gtk::Button:0x40a2a858 ptr=0x8237df8>
>> b.signal_emit("clicked")
=> nil
>> b.signal_handler_unblock 2
=> #<Gtk::Button:0x40a2a858 ptr=0x8237df8>
>> b.signal_emit("clicked")
2
=> nil
>>
```

### An Upgrade Hello world
Let's take a look at a slightly improved helloworld with better examples of callbacks block. This will also introduce us to our next topic, packing widgets.
```ruby
#!/usr/bin/env ruby

# Initializes Ruby/GTK2, as usual.
require 'gtk2'

# A push on a button will call this method.
def callback(widget)
  # Display the 'label' property of the widget.
  # Refer to the API reference for more information.
  puts "Hello again - #{widget.label}(#{widget}) was pressed."
end

# Creates the window.
window = Gtk::Window.new

# Specify the title and border of the window.
window.title = "Hello Buttons"
window.border_width = 10

# The program will directly end upon 'delete_event'.
window.signal_connect('delete_event') do
  Gtk.main_quit
  false
end

# We create a box to pack widgets into.  
# This is described in detail in the following section.
# The box is not really visible, it is just used as a tool to arrange
# widgets.
box1 = Gtk::HBox.new(false, 0)

# Put the box into the main window.
window.add(box1)

# Creates a new button with the label "Button 1".
button1 = Gtk::Button.new("Button 1")

# Now when the button is clicked, we call the "callback" method
# with a reference to "button 1" as its argument.
button1.signal_connect( "clicked" ) do |w|
  callback(w)
end

# Instead of window.add, we pack this button into the invisible
# box, which has been packed into the window.
box1.pack_start(button1, true, true, 0)

# Do these same steps again to create a second button.
button2 = Gtk::Button.new("Button 2")

# Call the same callback function with a different argument,
# passing a reference to "button 2" instead.
button2.signal_connect("clicked") do |w|
  callback(w)
end

# Pack the second button in a box as well.
box1.pack_start(button2, true, true, 0)

# You may call the show method of each widgets, as follows:
#   button1.show
#   button2.show
#   box1.show
#   window.show
window.show_all
Gtk.main
```
Like the first Hello World, you'll notice this time there is no easy way to exit the program, you have to use your window manager or command line to kill it.

A good exercise for the reader would be to insert a third "Quit" button that will exit the program.

You may also wish to play with the options to Gtk::Box#pack_start while reading the next section. Try resizing the window, and observe the behavior.
