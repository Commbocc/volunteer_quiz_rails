class AddBlurbToOpportunities < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :blurb, :text
  end
end
