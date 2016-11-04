class CreateAnswerOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_opportunities do |t|
      t.belongs_to :answer, foreign_key: true
      t.belongs_to :opportunity, foreign_key: true
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
