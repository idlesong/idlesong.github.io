## RubyOnRails tips

### Ruby
Array.new()
ruby-doc.org/core-3.1.2/Array

### rails
rails g -h

rails g migration -h

```
rails g scaffold order name:string
rails g migration add_order_id_to_line_item order_id:integer
```

        <% if line_item.price.nil? then %>
          <td><%= number_to_currency(line_price, unit: currency_unit) %> </td>
        <% else %>
          <td><%= link_to(number_to_currency(line_price, unit: currency_unit), price_path(line_item.price_id))%> </td>
        <% end %> 


