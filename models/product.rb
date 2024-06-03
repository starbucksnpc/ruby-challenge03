class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

  # id: primary key
  # name: string
  # description: text
  # price: decimal
  # stock_quantity: integer
  # category_id: integer, foreign key linking to categories table
  # created_at: datetime
  # updated_at: datetime

  # validation 1. All columns(other than foreign keys, the id, or datetime column) filled out.
  # validation 2. All product names are unique and longer than 3 characters.
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :stock_quantity, presence: true, numericality: { only_integer: true }

end
