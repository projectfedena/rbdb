class Base
  
  attr_reader :name
  
  def initialize name = nil
    @name = name
  end
  
  def to_param
    name
  end
  
  alias :id :name

  def self.execute sql
    ActiveRecord::Base.connection.execute sql
  end
  
  def new_record?
    @name.nil?
  end
  
  def sanitize_table(name)
    ActiveRecord::Base.connection.quote_table_name(name)
  end
  
end