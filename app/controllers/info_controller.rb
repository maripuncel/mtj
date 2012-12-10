class InfoController < ApplicationController

require 'net/http'
require 'json'

def get_companies()
  @a = 0
  json = ActiveSupport::JSON.decode(File.read(File.join(Rails.root, 'data', 'companies.json')))
  json.each do |j|
  @a += 1	
    if @a % 100 == 0
      j = JSON.parse(j.to_json)
      name = j["name"]
      permalink = j["permalink"]
      categorycode = j["category_code"]
      c = Company.new
      c.name = name
      c.permalink = permalink
      c.categorycode = categorycode
      c.save!
    end
  end
end

end
