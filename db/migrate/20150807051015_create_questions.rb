class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :description, :string

      t.integer :user_id
    end
  end
end
