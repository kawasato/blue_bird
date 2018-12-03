class CreateBirds < ActiveRecord::Migration[5.1]
  def change
    create_table :birds do |t|
      t.text:content
    end
  end
end
