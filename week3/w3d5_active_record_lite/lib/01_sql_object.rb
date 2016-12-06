require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    @columns = data[0].map do |column_name|
      column_name.to_sym
    end
  end

  def self.finalize!
    columns = self.columns
    columns.each do |column_name|
      define_method("#{column_name}") do
        self.attributes[column_name]
      end

      define_method("#{column_name}=") do |value|
        self.attributes[column_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
        "#{self.table_name}".*
      FROM
        "#{self.table_name}"
    SQL
    parse_all(data)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    results = DBConnection.instance.execute(<<-SQL, id)
      SELECT
      #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
      LIMIT
        1
    SQL
    if results
      parse_all(results).first
    else
      nil
    end
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |value| self.send(value) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map { |col| col.to_s }
    col_names = col_names.join(", ")
    n = columns.length
    question_marks = (["?"] * n).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.instance.last_insert_row_id
  end

  def update

    set = self.class.columns.map { |column| "#{column} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set}
      WHERE
        id = ?
    SQL

  end

  def save
    if id.nil?
      self.insert
    else
      self.update
    end
  end
end
