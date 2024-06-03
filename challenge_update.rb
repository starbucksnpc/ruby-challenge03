require_relative 'ar.rb'

#find all products with a stock quantity greater than 40.
products = Product.where('stock_quantity > ?', 40)

#add one to the stock quantity and save 
products.each do |product|
    product.stock_quantity += 1
    if product.save
        puts "Updated product #{product.name} with new stock quantity: #{product.stock_quantity}"
    else
        puts "Failed to update product #{product.name}: #{product.errors.full_messages.join(", ")}"
      end
    end