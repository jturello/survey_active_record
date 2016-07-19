class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:name, :string)
    end
  end
end
