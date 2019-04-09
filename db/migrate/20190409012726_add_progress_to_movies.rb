class AddProgressToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :progress, :integer
  end
end
