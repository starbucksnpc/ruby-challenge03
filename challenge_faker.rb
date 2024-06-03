require_relative 'ar.rb'
require 'faker'

# Create 10 new categories with Faker
10.times do
  category_name = Faker::Commerce.department
  category = Category.create(name: category_name)

  if category.persisted?
    puts "Created category: #{category.name}"

    # Create 10 new products for each category
    10.times do
      product_name = Faker::Commerce.product_name
      product_description = Faker::Lorem.sentence(10)  # 
      product_price = Faker::Commerce.price(range = 5.0..100.0)
      product_stock_quantity = Faker::Number.between(1, 100)

      product = category.products.create(
        name: product_name,
        description: product_description,
        price: product_price,
        stock_quantity: product_stock_quantity
      )

      if product.persisted?
        puts "  Created product: #{product.name} (Price: #{product.price}, Quantity: #{product.stock_quantity})"
      else
        puts "  Failed to create product: #{product.errors.full_messages.join(", ")}"
      end
    end
  else
    puts "Failed to create category: #{category.errors.full_messages.join(", ")}"
  end
end
