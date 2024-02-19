# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails  command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# coding: utf-8
Profile.create(:name => '太郎', :age => '20', :url => 'taro.html')
Profile.create(:name => '次郎', :age => '15', :url => 'jiro.html')
Profile.create(:name => '三郎', :age => '10', :url => 'saburou.html')