class AddImageSrcToOpportunities < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :image_src, :string
  end
end
