begin
  require 'active_record'
  class ActiveRecord::ConnectionAdapters::MysqlAdapter
    def allow_multi_statements!
      @connection.set_server_option(Mysql::OPTION_MULTI_STATEMENTS_ON)
    end
  end
rescue LoadError
end

module DBuddy
  def self.run(connection, *paths)
    connection.reconnect!
    ActiveRecord::Base.connection.allow_multi_statements!

    paths.each do |path|
      puts "Processing #{path}"
      begin
        connection.execute(File.read(path), "DBuddy: Reloading #{path}")
        puts "Done"
      rescue => e
        puts "Caught error"
        puts e.message
        puts e.backtrace
      end
    end
  end
end
