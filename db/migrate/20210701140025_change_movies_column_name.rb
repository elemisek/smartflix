class ChangeMoviesColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column(Movie, 'Title', 'title')
  end
end
