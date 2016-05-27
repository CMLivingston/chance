class AddMeetlocToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :meet_loc, :string
  end
end
