class ImagesController < ApplicationController
	

	
	def  idcard
		send_data = {"appid"=> "12532a1231232148133","bucket"=>"images","card_type"=>0,"url_list"=>["http://gold800.cn/mycard.jpg"]}
		header = {"Host"=> "service.image.myqcloud.com","Authorization"=> get_sign,"Content-Type"=>"application/json"}
		# response = send_https("https://www.gold800.com:9250/HomeV2Controller/HomeLoadVIP", "psot",send_data, header)
		response = send_http("http://service.image.myqcloud.com/ocr/idcard","psot", send_data, header)
		#百度orc文字识别
		# send_data = {"fromdevice"=>"pc","clientip"=>"","detecttype"=>"LocateRecognize","languagetype"=>"CHN_ENG","imagetype"=>"1","image"=>"/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDABMNDxEPDBMREBEWFRMXHTAfHRsbHTsqLSMwRj5KSUU+RENNV29eTVJpU0NEYYRiaXN3fX59S12Jkoh5kW96fXj/2wBDARUWFh0ZHTkfHzl4UERQeHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHj/wAARCAAfACEDAREAAhEBAxEB/8QAGAABAQEBAQAAAAAAAAAAAAAAAAQDBQb/xAAjEAACAgICAgEFAAAAAAAAAAABAgADBBESIRMxBSIyQXGB/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APawEBAQEBAgy8i8ZTVV3UY6V1eU2XoWDDZB19S646Gz39w9fkKsW1r8Wm2yo1PYis1be0JG9H9QNYCAgc35Cl3yuVuJZl0cB41rZQa32dt2y6OuOiOxo61vsLcVblxaVyXD3hFFjL6La7I/sDWAgICAgICB/9k="}
		# header = {"Content-Type"=>"application/x-www-form-urlencoded","apikey"=> "42d199bc0a50cd8e109ff880ecc444fe"}
		# response = send_http("http://apis.baidu.com/apistore/idlocr/ocr","post",send_data, header)
		#百度orc文字识别

		# sign = get_sign
		pp "===#{response.body}============"
		respond_to do |format|
			format.json { render json:response.body, status: :ok }
		end
	end
end
