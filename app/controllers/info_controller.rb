class InfoController < ApplicationController

require 'net/http'

def getinfo(result)
  result = Net::HTTP.get(URI.parse('http://api.crunchbase.com/v/1/companies.js?api_key=wxqjndu9upq49fwfkh2r6csu'))
  parsed_json = JSON.parse(result)
  companies = []
  a = 0
  parsed_json do |k|
    companies << k.name
    a += 1
    if a > 1
      break
    end
  end

end

def getinfo2(result)
  companies do |k|
    companyname = k
    result = Net::HTTP.get(URI.parse('http://api.crunchbase.com/v/1/'+companyname+'.js?api_key=wxqjndu9upq49fwfkh2r6csu'))
    parsed_json = JSON.parse(result)
    a = Company.create(:name => parsed_json.name)
  end
  render :root
end


end
