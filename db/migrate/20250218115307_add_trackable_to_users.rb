class AddTrackableToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :sign_in_count, :integer, default: 0, null: false
  end
end
