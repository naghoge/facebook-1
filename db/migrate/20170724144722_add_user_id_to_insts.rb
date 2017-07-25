class AddUserIdToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :user_id, :integer
  end
end
