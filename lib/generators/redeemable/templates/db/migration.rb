class <%= "Create#{class_name.pluralize.gsub(/::/, '')}" %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|

      t.column :user_id, :integer
      t.column :code, :string
      
      t.column :redeemed_at, :datetime
      t.column :redeemed_by_id, :integer

      t.column :expires_on, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
