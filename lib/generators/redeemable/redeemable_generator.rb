require 'rails/generators/migration' 

class RedeemableGenerator < Rails::Generators::Base #:nodoc:
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  argument :class_name, :type => :string

  def self.next_migration_number(dirname)
   if ActiveRecord::Base.timestamped_migrations
     Time.now.utc.strftime("%Y%m%d%H%M%S")
   else
     "%.3d" % (current_migration_number(dirname) + 1)
   end
 end

  def generate_model
    template "app/models/model_template.rb", "app/models/#{file_name}.rb"
  end

  def generate_migration
    migration_template 'db/migration.rb', "db/migrate/create_#{table_name}"
  end

  def generate_test_and_fixtures
    template "test/fixtures/model.yml", "test/fixtures/#{table_name}.yml"
    template "test/unit/model_test.rb", "test/unit/#{file_name}.rb"
  end

  private

  def file_name
    class_name.underscore
  end

  def table_name
    file_name.gsub(/\//, '_').pluralize
  end
end