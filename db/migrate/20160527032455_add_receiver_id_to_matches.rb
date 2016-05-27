class AddReceiverIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :receiver_id, :integer
  end
end
