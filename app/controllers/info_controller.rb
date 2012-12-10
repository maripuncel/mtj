class InfoController < ApplicationController

require 'net/http'
require 'json'

def get_companies()
  @a = 0
  json = ActiveSupport::JSON.decode(File.read(File.join(Rails.root, 'data', 'companies.json')))
  json.each do |j|
  @a += 1	
    if @a % 100 == 0
      name = JSON.parse(j.to_json)["name"]
      c = Company.create(:name => name)    
    end
  end
end

end
