require_relative 'ar.rb'

# Find all categories in the database
categories = Category.all

# Iterate over each category
categories.each do |category|
  puts "Category: #{category.name}"

  # Iterate over the associated products of each category
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: #{product.price}"
  end

  puts "\n" # Add a newline for better readability
end
