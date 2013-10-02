class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :popularity, :integer, default: 0
  end
end
