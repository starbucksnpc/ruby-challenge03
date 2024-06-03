require_relative 'ar.rb'

# first way to create new product 
product1 = Product.new(name: 'Product1', description: 'Description1', price:12.34, stock_quantity: 10)
if product1.save
    puts "Product1 saved successfully."
else 
    puts "Failed to save Product1: #{product1.errors.full_messages.join(", ")}"
end

# second way to create new product
product2 = Product.create(name: 'Product2', description: 'Description2', price:23.45, stock_quantity: 20)
if product2.persisted?
    puts "Product2 created and saved successfully."
else
    puts "Fail to create and save Product2: #{product2.errors.full_messages.join(", ")}"
end

# third way to create new product
begin
    product3 = Product.new(name: 'Product3', description: 'Description3', price:34.56, stock_quantity: 30)
    product3.save!
    puts "Product3 saved successfully."
rescue ActiveRecord::RecordInvalid => e
    puts "Failed to save Product3: #{e.message}"
end

# create and save a product object that is missing some required columns.
invalid_product = Product.new(name: 'Pro', price: 67.89)
unless invalid_product.save
    puts "Failed to save invalid product: #{invalid_product.errors.full_messages.join(", ")}"
end
