class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.text :options
      t.integer :answer
      t.string :image_url
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
