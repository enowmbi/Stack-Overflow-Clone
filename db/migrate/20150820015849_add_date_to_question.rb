class AddDateToQuestion < ActiveRecord::Migration
  def change_table
    add_column(:questions, :created_at, :datetime)
    add_column(:questions, :updated_at, :datetime)
  end
end
