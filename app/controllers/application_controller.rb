class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	require "net/https"  
	require "uri"
  require 'digest/sha1'
  require 'base64'
  require 'openssl'

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  #通过覆盖 default_url_options 方法 集中修改 URL 动态生成规则
  def default_url_options
    { locale: I18n.locale }
  end

  def send_https(url,method="post",data={},header={"Content-Type"=>"application/json"})
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    if method == "post"

      request = Net::HTTP::Post.new(uri.request_uri ,  header)
      request.set_form_data(data)
      response = http.request(request)
    elsif method == "get"
       request = Net::HTTP::Get.new(uri.request_uri,header)
       request.set_form_data(data)

       response = http.request(request)
     end
    return response
  end

  def send_http(url,method="post",data={},header={"Content-Type"=>"application/json"})
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)

    request.set_form_data(data)
    pp "---data-",request
    res = http.request(request)
    return res
  end

  #获取签名
  def get_sign
    appid = "12532123243448133"
    bucket = "asdsadsad"
    secret_id = "AKIDW3LOCkFWZNdasadsuBE1fmmZ6f05tPikVyJ6qK"
    secret_key = "KPDm9IBsdffdsd3rGNGrCGFF0g6HDtJTO3RaS4QW"
    expired = Time.now.to_i + 2592000
    onceExpired = 0
    current = Time.now.to_i
    rdm = [*('a'..'z'),*('A'..'Z'),*(0..9)].shuffle[0..9].join
    userid = 0
    srcStr ="a=#{appid}&b=#{bucket}&k=#{secret_id}&e=#{expired}&t=#{current}&r=#{rdm}&u=#{userid}&f="

    signStr = Base64.encode64("#{OpenSSL::HMAC.digest('sha1',srcStr, secret_key)}#{srcStr}")+"\n"
    pp "===#{signStr}"
    return signStr
  end

end
