## Packing Widgets
When creating an application, you'll want to put more than one widget inside a window.

Our first helloworld example only used one widget so we could simply use
[Gtk::Container#add](http://www.gtk.org)  to "pack" the widget into the window. But when you want to
put more than one widget into a window, how do you control where that widget is positioned?

This is where packing comes in.

### Theory of Packing Boxes

Most packing is done by creating boxes. These are invisible widget containers that we can pack our widgets into which come in two forms, a horizontal box, and a vertical box. When packing widgets into a horizontal box, the objects are inserted horizontally from left to right or right to left depending on the method used. In a vertical box, widgets are packed from top to bottom or vice versa. You may use any combination of boxes inside or beside other boxes to create the desired effect.

To create a new horizontal box, we use [Gtk::HBox.new](), and for vertical boxes, [Gtk::VBox.new]().

The [Gtk::Box#pack_start]() and [Gtk::Box#pack_end]() methods are used to place objects inside of these containers.

The Gtk::Box#pack_start method will start at the top and work its way down in a vbox, and pack left to right in an hbox. Gtk::Box#pack_end will do the opposite, packing from bottom to top in a vbox, and right to left in an hbox.

Using these methods allows us to right justify or left justify our widgets and may be mixed in any way to achieve the desired effect. We will use Gtk::Box#pack_start in most of our examples. An object may be another container or a widget. In fact, many widgets are actually containers themselves, including the button, but we usually only use a label inside a button.

By using these methods, GTK knows where you want to place your widgets so it can do automatic resizing and other nifty things. There are also a number of options as to how your widgets should be packed. As you can imagine, this method gives us a quite a bit of flexibility when placing and creating widgets.

### Details of Boxes
Because of this flexibility, packing boxes in GTK can be confusing at first. There are a lot of options, and it's not immediately obvious how they all fit together. In the end, however, there are basically five different styles.

packbox1.png

Each line contains one horizontal box (hbox) with several buttons. The call of Gtk::Box#pack is shorthand for the call to pack each of the buttons into the hbox. Each of the buttons is packed into the hbox the same way (i.e., same arguments to the Gtk::Box#pack_start method).

#### Using Gtk::Box#pack_start method, looks like this:
``` ruby
Gtk::Box#pack_start(child, expand, fill, padding)
```
1. The child argument is the object you are packing the into the box. The objects will all be buttons for now, so we'll be packing buttons into boxes.

2. The expand argument to [Gtk::Box#pack_start]() and [Gtk::Box#pack_end]() controls how the widgets are laid out in the box:
> **If expand is true**:
> widgets will fill in all the extra space in the box so the box is automatically expanded to fill the area allotted to it;
>
> **If expand is false**:
> the box is shrunk to just fit the widgets.
>
> Setting expand to false will allow you to do right and left justification of your widgets. Otherwise, they will all expand to fit into the box, and the same effect could be achieved by using only one of [Gtk::Box#pack_start]() or [Gtk::Box#pack_end]().

3. The fill argument controls where the space given to the object by the expand option is allocated:
> **If fill is true**:
> the object is extented to fit the allocated space;
>
>**If fill is false**:
>the object is left with its original size, and extra padding is added around it.
>
>Note that the fill argument only has an effect if the expand argument is true.

#### Creating a new horizontal box, it looks like this:
``` ruby
Gtk::HBox.new(homogeneous, spacing)
```
- The homogeneous argument to [Gtk::HBox.new]() (and the same for [Gtk::VBox.new]()) controls whether each object in the box has the same size (i.e., the same width in an hbox, or the same height in a vbox). If it is set, the [Gtk::Box#pack_start]() or [Gtk::Box#pack_end]() methods work essentially as if the expand argument was always set to true.

- What's the difference between spacing (set when the box is created) and padding (set when elements are packed)? Spacing is added between objects, and padding is added on either side of an object. The following screenshot should make it clearer:

packbox2.png

Following is the code used to create the above screenshots. It is commented fairly heavily so I hope you won't have any problems following it. Just play with it.

### Packing Demonstration Program
``` ruby
#!/usr/bin/env ruby

require 'gtk2'

# Make a new hbox filled with button-labels. Arguments for Gtk::HBox.new and
# Gtk::Box#pack_start we are interested are passed in to this method.
def make_box(homogeneous, spacing, expand, fill, padding)
    box = Gtk::HBox.new(homogeneous, spacing)

    "Gtk::Box#pack_start (button, #{expand}, #{fill}, #{padding})".split(/ /).each do |s|
        button = Gtk::Button.new(s)
        box.pack_start(button, expand, fill, padding)
    end
    box
end

# Parse command line argument.
which = ARGV.shift
unless which
    $stderr.puts "usage: #{$0} num"
    $stderr.puts "	where num is 1, 2, or 3."
    exit 1
end

# Creates the main window.
window = Gtk::Window.new

# You should always remember to connect the delete_event signal
# to the main window. This is very important for proper intuitive
# behavior.
window.signal_connect("delete_event") do
    Gtk::main_quit
    false
end
window.border_width = 10

# We create a vertical box (vbox) to pack the horizontal boxes into (created by make_box).
# This allows us to stack the horizontal boxes filled with buttons one
# on top of the other in this vbox.
box1 = Gtk::VBox.new(false, 0)

case which.to_i
when 1
    # Creates and aligns a new label to the left side.  
    # We'll discuss this function and others in the section on Widget Attributes.
    label = Gtk::Label.new("Gtk::HBox.new(false, 0)")
    label.set_alignment(0, 0)
    box1.pack_start(label, false, false, 0)

    # The 2 first entries are for homegeneous and spacing parameters for Gtk::HBox.new.
    # The 3 last entries are for expand, fill and padding parameters for Gtk::HBox#pack_start.
    [
        [false, 0, false, false, 0],
        [false, 0, true,  false, 0],
        [false, 0, true,  true,  0],
    ].each do |args|
        # Create a horizontal box with the specified parameters
        # and pack it on top of the vertical box.

        box2 = make_box(*args)
        box1.pack_start(box2, false, false, 0)
    end

    # Insert a separator in the vertical box.
    separator = Gtk::HSeparator.new
    box1.pack_start(separator, false, true, 5)

    # Same as previous.
    label = Gtk::Label.new("Gtk::HBox.new(true, 0)")
    label.set_alignment(0, 0)
    box1.pack_start(label, false, false, 0)
    [
        [true, 0, true, false, 0],
        [true, 0, true, true,  0],
    ].each do |args|
        box2 = make_box(*args)
        box1.pack_start(box2, false, false, 0)
    end

    separator = Gtk::HSeparator.new
    box1.pack_start(separator, false, true, 5)

when 2
    label = Gtk::Label.new("Gtk::HBox.new(false, 10)")
    label.set_alignment(0, 0)
    box1.pack_start(label, false, false, 0)

    [
        [false, 10, true, false, 0],
        [false, 10, true, true,  0],
    ].each do |args|
        box2 = make_box(*args)
        box1.pack_start(box2, false, false, 0)
    end

    separator = Gtk::HSeparator.new
    box1.pack_start(separator, false, true, 5)

    label = Gtk::Label.new("Gtk::HBox.new(false, 0)")
    label.set_alignment(0, 0)
    box1.pack_start(label, false, false, 0)

    [
        [false, 0, true, false, 10],
        [false, 0, true, true,  10],
    ].each do |args|
        box2 = make_box(*args)
        box1.pack_start(box2, false, false, 0)
    end

    separator = Gtk::HSeparator.new
    box1.pack_start(separator, false, true, 5)

when 3
    # This demonstrates the ability to use Gtk::Box#pack_end to
    # right justify widgets. First, we create a new box as before.
    box2 = make_box(false, 0, false, false, 0);

    # Create a label that will be put at the end.
    label = Gtk::Label.new("end")
    box2.pack_end(label, false, false, 0)
    box1.pack_start(box2, false, false, 0)

    # A separator for the bottom.
    separator = Gtk::HSeparator.new

    # This explicitly sets the separator to 400 pixels wide by 5 pixels
    # high. This is so the hbox we created will also be 400 pixels wide,
    # and the "end" label will be separated from the other labels in the
    # hbox. Otherwise, all the widgets in the hbox would be packed as
    # close together as possible.
    separator.set_size_request(400, 5)
    box1.pack_start(separator, false, true, 5)
end

# Creates a new box, and packs a 'quit' button to it.
# This button can be used to terminate the program, exactly like the window
# close cross.
quitbox = Gtk::HBox.new(false, 0)
button = Gtk::Button.new("Quit")
button.signal_connect("clicked") do
    Gtk.main_quit
end

quitbox.pack_start(button, true, false, 0)
box1.pack_start(quitbox, true, false, 0)
window.add(box1)

# Display all widgets.
window.show_all

# As usual, we finish by entering the main loop, with Gtk.main.
Gtk.main
```

### Packing Using Tables
Let's take a look at another way of packing - Tables. These can be extremely useful in certain situations.

Using tables, we create a grid that we can place widgets in. The widgets may take up as many spaces as we specify.

The first thing to look at, of course, is the Gtk::Table.new constructor:
``` ruby
Gtk::Table.new(rows, columns, homogeneous)
```
The first argument is the number of rows to make in the table, while the second, obviously, is the number of columns.

The homogeneous argument has to do with how the table's boxes are sized. If homogeneous is true, the table boxes are resized to the size of the largest widget in the table. If homogeneous is false, the size of a table boxes is dictated by the tallest widget in its same row, and the widest widget in its column.

The rows and columns are laid out from 0 to n, where n was the number specified in Gtk::Table.new. So, if you specify rows = 2 and columns = 2, the layout would look something like this:
```
.0          1          2
0+----------+----------+
 |          |          |
1+----------+----------+
 |          |          |
2+----------+----------+
```
Note that the coordinate system starts in the upper left hand corner. To place a widget into a box, use the following method:

``` ruby
Gtk::Table#attach(child,
                  left_attach, right_attach, top_attach, bottom_attach,
                  xoptions, yoptions,
                  xpadding, ypadding)
```
1. The first argument ("child") is the widget you wish to place in the table.

2. The left and right attach arguments specify where to place the widget, and how many boxes to use. If you want a button in the lower right table entry of our 2x2 table, and want it to fill that entry only, left_attach would be = 1, right_attach = 2, top_attach = 1, bottom_attach = 2.

  Now, if you wanted a widget to take up the whole top row of our 2x2 table, you'd use left_attach = 0, right_attach = 2, top_attach = 0, bottom_attach = 1.

3. The xoptions and yoptions are used to specify packing options and may be bitwise OR'ed together*1 to allow multiple options.
>These options are:
>
> **Gtk::FILL**
>    If the table box is larger than the widget, then this widget will expand to use all the room available.
>
> **Gtk::SHRINK**
>    If the table widget was allocated less space than was requested (usually by the user resizing the window), then the widgets would normally just be pushed off the bottom of the window and disappear. If Gtk::SHRINK is specified, the widgets will shrink with the table.
>
> **Gtk::EXPAND**
>    This will cause the table to expand to use up any remaining space in the window.

4. Padding is just like in Gtk::Box, creating a clear area around the widget specified in pixels.

Gtk::Table#attach has a lot of options. So, there's a shortcut:
``` ruby
Gtk::Table#attach_defaults(widget, left_attach, right_attach, top_attach, bottom_attach)
```
- The X and Y options default to [Gtk::FILL]() | [Gtk::EXPAND](), and X and Y padding are set to 0. The rest of the arguments are identical to the previous method.
- We also have Gtk::Table#set_row_spacing and Gtk::Table#set_col_spacing. These place spacing between the rows at the specified row or column.
``` ruby
   Gtk::Table#set_row_spacing(row, spacing)
   Gtk::Table#set_col_spacing(column, spacing)
```
> Note that for columns, the space goes to the right of the column, and for rows, the space goes below the row.

You can also set a consistent spacing of all rows and/or columns with:
``` ruby
 Gtk::Table#set_row_spacings(spacing)
 Gtk::Table#set_col_spacings(spacing)
```
> Note that with these calls, the last row and last column do not get any spacing.

### Table Packing Example
Here we make a window with three buttons in a 2x2 table. The first two buttons will be placed in the upper row. A third, quit button, is placed in the lower row, spanning both columns.

Here is the source code:
``` ruby
#!/usr/bin/env ruby

require 'gtk2'

window = Gtk::Window.new("Table")
window.signal_connect("delete_event") do
    Gtk.main_quit
    false
end
window.border_width = 20

# Creates a 2x2 table.
table = Gtk::Table.new(2, 2, true)
window.add(table)

[1, 2].each do |i|
    button = Gtk::Button.new("button #{i}")
    button.signal_connect("clicked") do
        puts "Hello again - button #{i} was pressed"
    end
    # Insert button 1 into the upper left quadrant of the table,
    # and button 2 into the upper right quadrant of the table.
    table.attach_defaults(button, i - 1, i, 0, 1)
end

button = Gtk::Button.new("Quit")
button.signal_connect("clicked") do
    Gtk::main_quit
end

# Insert the quit button into the both lower quadrants of the table.
table.attach_defaults(button, 0, 2, 1, 2)

window.show_all
Gtk.main
```
