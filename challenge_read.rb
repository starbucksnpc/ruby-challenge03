require_relative 'ar.rb'

#check all rows of products table
product = Product.first
puts "Inspecting first product: #{product.inspect}"

#total number of products
number_of_products = Product.count
puts "There are #{number_of_products} products in the products table."

#The names of all products above $10 with names that begin with the letter C.
expensive_c_products = Product.where('price > ? AND name Like ?', 10, 'C%')
puts "Products above $10 and names starting with 'C':"
expensive_c_products.each { |p| puts p.name}

#Low is defined as less than 5 in stock.
low_stock_products_count = Product.where('stock_quantity > ?', 5).count
puts "Total number of products with low stock quantity: #{low_stock_products_count}"


# 1. Find the name of the category associated with one of the products you have found
category_name = product.category.name
puts "The category associated with the product '#{product.name}' is '#{category_name}'."

# 2. Find a specific category and use it to build and persist a new product associated with this category
category = Category.find_by(name: 'Beverages') 
if category
  # Building a new product using the has_many association
  new_product = category.products.build(name: 'NewProduct', description: 'A new product description', price: 15.99, stock_quantity: 50)
  if new_product.save
    puts "Created new product '#{new_product.name}' associated with category '#{category.name}'."
  else
    puts "Failed to create new product: #{new_product.errors.full_messages.join(", ")}"
  end
else
  puts "Category 'Beverages' not found."
end

# 3. Find a specific category and then use it to locate all the associated products over a certain price
price_threshold = 20.00
if category
  expensive_category_products = category.products.where('price > ?', price_threshold)
  expensive_category_product_names = expensive_category_products.pluck(:name)
  puts "Products in category '#{category.name}' with price above #{price_threshold}: #{expensive_category_product_names.join(', ')}"
end