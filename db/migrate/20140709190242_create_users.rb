class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :dollars
      t.string :password_digest
      t.string :remember_token
      t.timestamps
    end

    create_table :tools do |t|
      t.string :name
      t.integer :speed
      t.integer :price
      t.timestamps
    end

    create_table :mines do |t|
      t.string :name
      t.integer :depth
      t.integer :richness
      t.string :image
      t.integer :user_id
      t.timestamps
    end

    create_table :inventories do |t|
      t.belongs_to :user
      t.belongs_to :tool
      t.timestamps
    end
  end
end
