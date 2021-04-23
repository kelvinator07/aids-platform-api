class AddResponsesCountToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :responses_count, :integer
  end
end
