class AddBoolsToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :hide_questions, :boolean
    add_column :answers, :show_donate_btn, :boolean
  end
end
