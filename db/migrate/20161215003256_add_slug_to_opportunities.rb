class AddSlugToOpportunities < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :slug, :string
    add_index :opportunities, :slug, unique: true
  end
end
