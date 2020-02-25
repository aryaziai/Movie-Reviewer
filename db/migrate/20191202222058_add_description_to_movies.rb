class AddDescriptionToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :description, :text
  end
end
