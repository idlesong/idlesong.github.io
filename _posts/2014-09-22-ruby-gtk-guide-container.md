---
layout: post
title:  "guide-container"
categories: jekyll update
---
## Container Widgets
### Short Description

We cover here two types of container widgets: decorators and layout containers. Then we will describe other important container widgets as mentioned on the above list.
Container Widget

## Container Widget
Gtk::Container class is an abstract base class for all GTK+ widgets. It introduces style properties and basic behaviour (functionality) needed by all Widgets. Container class is direct descendant of the Gtk::Widget class, hence all the Container objects are also Widgets. This is important to know because when you will have hard time finding an appropriate feature for your object it is likely that it is provided by the Widget class, which contains a large number of methods (behaviour or functionality), properties as well as signals. Nevertheless, we are here concerned only with the Container widgets.
Decorator Containers

### Decorator Containers
In every program so far you have encountered Gtk::Window class, a widget derived from Gtk::Bin. Bin class is a type of the container class that can hold only a single child widget. Widgets derived from this class are called decorator containers. They add some type of functionality to the child. For instance, a Gtk::Window is provides its child with the functionality of being placed in a top-level widget, a Gtk::Button makes its child into a clickable entity, a Gtk::Frame class draws a frame around its child, a Gtk::EventBox allows its child that otherwise is incapable of catching GDK events, to catch them for its child, or a Gtk::Expander hides or shows its child from users.

#### Following is a list of classes (decorators) derived from Gtk::Bin:
-    Gtk::Window
-    Gtk::Alignment
-    Gtk::Frame
-    Gtk::Button
-    Gtk::Item
-    Gtk::ComboBox
-    Gtk::EventBox
-    Gtk::Expander
-    Gtk::HandleBox
-    Gtk::ToolItem
-    Gtk::ScrolledWindow
-    Gtk::Viewport

### Layout Containers
-    Gtk::Alignment - A widget which controls the alignment and size of its child
-    Gtk::AspectFrame - A frame that constrains its child to a particular aspect ratio
-    Gtk::HBox - A horizontal container box
-    Gtk::VBox - A vertical container box
-    Gtk::HButtonBox - A container for arranging buttons horizontally
-    Gtk::VButtonBox - A container for arranging buttons vertically
-    Gtk::Fixed - A container which allows you to position widgets at fixed coordinates
-    Gtk::HPaned - A container with two panes arranged horizontally
-    Gtk::VPaned - A container with two panes arranged vertically
-    Gtk::Layout - Infinite scrollable area containing child widgets and/or custom drawing
-    Gtk::Notebook - A tabbed notebook container
-    Gtk::Table - Pack widgets in regular patterns
-    Gtk::Expander - A container which can hide its child

### Container signals
-    add
-    check-resize
-    remove
-    set-focus-child



### Horizontal and Vertical Boxes


contwidg-hwbox.png

The Gtk::Box is the abstract base class which provides almost all the behavior and properties for its descendants. On the other hand the horizontal and vertical box classes Gtk::HBox and Gtk::VBox, respectively provide only the functionality to create the widgets.

``` ruby

#!/usr/bin/env ruby

require 'gtk2'

window = Gtk::Window.new
window.border_width = 10
window.set_size_request(150, -1)
window.title = "Vd. - Boxes"

window.signal_connect('delete_event') { false }
window.signal_connect('destroy') { Gtk.main_quit }

labels = %w[Andrew Joe Samantha Jonatan]

            # homogeneous, spacing
vbox = Gtk::VBox.new(false, 0)

labels.each do |name|
  btt = Gtk::Button.new(name)
  btt.signal_connect("clicked") {btt.destroy}
  vbox.pack_start_defaults(btt)
end

window.add(vbox)
window.show_all
Gtk.main
```

Beside the fact that two of the programs create vertical and the other two horizontal boxes, the main difference to be noticed is in the difference how we pack the buttons. One packing instruction uses defaults, while the other takes after the child (button in our case) three additional arguments:

- expand = true; value true means the new child is to be given extra space allocated to box. The extra space will be divided evenly between all children of box that use this option.
- fill = true; value true means that space given to child by the expand option is actually allocated to child, rather than just padding it. This parameter has no effect if expand is set to false.
- padding = 0; this integer value represents extra space in pixels to put between this child and its neighbours

There are actually exist four packing instance methods defined in the abstract base class Gtk::Box, from which both horizontal and vertical boxes are derived:

``` ruby
Gtk::Box#pack_start(child, expand = true, fill = true, padding = 0)
Gtk::Box#pack_end(child, expand = true, fill = true, padding = 0)
Gtk::Box#pack_end_defaults(child)
Gtk::Box#pack_start_defaults(child)
```

In all of the above assigned values represent the default values.

For the completeness sake let me add also one of the other variants - this time the horizontal with explicitly specified "expand", "fill", and "padding" arguments.

``` ruby
#!/usr/bin/env ruby

require 'gtk2'

window = Gtk::Window.new
window.border_width = 10
window.set_size_request(150, -1)
window.title = "H-Boxes"

window.signal_connect('delete_event') { false }
window.signal_connect('destroy') { Gtk.main_quit }

labels = %w[Andrew Joe Samantha Jonatan]

           # homogeneous, spacing
hbox = Gtk::HBox.new(false, 0)

labels.each do |name|
  btt = Gtk::Button.new(name)
  btt.signal_connect("clicked") {btt.destroy}

              # child, expand, fill, padding
  hbox.pack_start(btt, false, false, 5)
end

window.add(hbox)
window.show_all
Gtk.main
```

#### Gtk::Box functionality (behaviour)
-    **pack_start(child, expand = true, fill = true, padding = 0)** - Adds child to box, packed with reference to the start of box. The child is packed after any other child packed with reference to the start of box.
-    **pack_end(child, expand = true, fill = true, padding = 0)** - Adds child to box, packed with reference to the end of box. The child is packed after (away from end of) any other child packed with reference to the end of box.
-    **pack_start_defaults(widget)** - Adds widget to box, packed with reference to the start of box. The child is packed after any other child packed with reference to the start of box. Parameters for how to pack the child widget, expand, fill, and padding, are given their default values, true, true, and 0, respectively.
-    **pack_end_defaults(widget)** - Adds widget to box, packed with reference to the end of box. The child is packed after (away from end of) any other child packed with reference to the end of box. Parameters for how to pack the child widget, expand, fill, and padding, are given their default values, true, true, and 0, respectively.
-    **homogeneous?** - Returns whether the box is homogeneous (all children are the same size).
-    **homogeneous=(homogeneous)** - Sets the homogeneous field of Gtk::Box, controlling whether or not all children of box are given equal space in the box.
-    **set_homogeneous(homogeneous)** - Same as Gtk::Box#homogeneous=.
-    **spacing** - Returns the spacing.
-    **spacing=(spacing)** - Sets the spacing field of Gtk::Box, which is the number of pixels to place between children of box.
-    **set_spacing(spacing)** - Same as Gtk::Box#spacing=.
-    **reorder_child(child, position)** - Moves child to a new position in the list of box children. The list is the children field of Gtk::Box, and contains both widgets packed Gtk::PACK_START as well as widgets packed Gtk::PACK_END, in the order that these widgets were added to box. A widget's position in the box children list determines where the widget is packed into box. A child widget at some position in the list will be packed just after all other widgets of the same packing type that appear earlier in the list.
-    **query_child_packing(child)** - Returns information about how child is packed into box.
-    **set_child_packing(child, expand, fill, padding, pack_type)** - Sets the way child is packed into box.
-    **ref_accessible** - See Atk::Implementor#ref_accessible.
-    **add_child** - See Gtk::Buildable#add_child.
-    **construct_child** - See Gtk::Buildable#construct_child.
-    **get_internal_child** - See Gtk::Buildable#get_internal_child.
-    **name** - See Gtk::Buildable#name.
-    **name=** - See Gtk::Buildable#name=.
-    **set_buildable_property** - See Gtk::Buildable#set_buildable_property.
-    **set_name** - See Gtk::Buildable#set_name.

#### Properties
-    homogeneous = false: true or false - Whether the children should all be the same size
-    spacing: Integer - The amount of space between children

#### Child Properties
-    expand: true or false; (defauly = true) - Whether the child should receive extra space when the parent grows
-    fill:true or false; (defauly = true) - Whether extra space given to the child should be allocated to the child or used as padding
-    pack-type: (default = Gtk::PACK_START) - A Gtk#PackType indicating whether the child is packed with reference to the start or end of the parent
-    padding: Integer - Extra space to put between the child and its neighbors, in pixels
-    position: Integer - The index of the child in the parent
