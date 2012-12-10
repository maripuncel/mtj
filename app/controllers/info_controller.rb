class InfoController < ApplicationController

require 'net/http'

def get_companies(result)
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

def get_company_info(result)
  companies do |k|
    companyname = k
    parsed_json = JSON.parse(result)
    a = Company.create(:name => parsed_json.name)
  end
  render :root
end


end
