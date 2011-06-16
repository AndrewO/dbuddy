module DBuddy
  def self.run(connection, *paths)
    paths.each do |path|
      puts "Processing #{path}"
      begin
        connection.execute(File.read(path), "DBuddy: Reloading #{path}")
      rescue => e
        puts "Caught error"
        puts e.message
        puts e.backtrace
      end
    end
  end
end
