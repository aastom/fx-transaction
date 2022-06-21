class CreateUuidPsqlExtension < ActiveRecord::Migration[7.0]
  def self.up
    enable_extension 'uuid-ossp'
  end

  def self.down
    disable_extension 'uuid-ossp'
  end
end
