class AddPlotToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :plot, :text
  end
end
