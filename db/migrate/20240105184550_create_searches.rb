class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :search_term
      t.string :user_ip

      t.timestamps
    end
  end
end
