json.balance    @balance
json.cart_items do
  json.array! @cart_items, partial: 'cart_items/cart_item', as: :cart_item
end
