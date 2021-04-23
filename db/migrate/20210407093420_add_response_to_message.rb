class AddResponseToMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :response, null: false, foreign_key: true
  end
end
