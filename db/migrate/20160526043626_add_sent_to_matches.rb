class AddSentToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :sent, :boolean
  end
end
