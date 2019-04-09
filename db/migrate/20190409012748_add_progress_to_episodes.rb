class AddProgressToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :progress, :integer
  end
end
