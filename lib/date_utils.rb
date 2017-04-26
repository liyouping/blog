# encoding: UTF-8
# require "open-uri"
require 'json'
require 'net/http'

class DateUtils
  #是否是工作日http://www.easybots.cn/holiday_api.net
  #工作日对应结果为 0, 休息日对应结果为 1, 节假日对应的结果为 2
  #例子http://www.easybots.cn/api/holiday.php?d=20170501
  def self.workday?(date)
    response = Net::HTTP.get_response(URI("http://www.easybots.cn/api/holiday.php?d=#{date}"))
    result=JSON.parse(response.body)
    return result[date] == "0"
  end
end

# def http_get(url)
#   html_response = nil
#   open(url) do |http|
#     html_response = http.read
#   end
#   puts html_response
# end