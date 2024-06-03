require_relative 'ar.rb'

# find and delete the product from the db
product_to_delete = Product.find_by(name: 'Product3')

if product_to_delete
    product_to_delete.destroy
    puts "Deleted product: #{product_to_delete.name}"
else
    puts "Product not found."
end
