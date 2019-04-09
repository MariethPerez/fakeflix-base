class AddStatusToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :status, :string
  end
end
