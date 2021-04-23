class AddRequestTypeToRequests < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE request_type AS ENUM ('one_time', 'material_need');
    SQL

    add_column :requests, :request_type, :request_type, index: true
  end

  def down
    remove_column :requests, :request_type

    execute <<-SQL
      DROP TYPE request_type;
    SQL
  end
end
