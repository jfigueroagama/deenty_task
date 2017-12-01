require 'csv'

namespace :setting do
  task :countries => :environment do
    puts "\nLoading Countries. This may take a few minutes..."
    file_path = Rails.root.join("db/setting_countries.csv")
    CSV.foreach(file_path, headers: true) do |row|
      begin
        country_name = row[0]
        country = Country.new(name: country_name)
        country.save!
        puts "Country: #{country.name} added."
      rescue Exception => e
  		    puts "ERROR: a row has failed, exception is: #{e.message}"
      end
    end
  end
end
