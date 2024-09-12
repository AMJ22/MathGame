class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.integer :number1
      t.integer :number2
      t.string :operation
      t.integer :answer

      t.timestamps
    end
  end
end
