class AddPositionToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :position, :integer
  end
end
