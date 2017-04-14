class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  #当用户发消息的时候
  on :text do |request, content|
    if content == "图文"
      # 微信最多显示8条新闻，大于8条将只取前8条
      count = content.gsub!(/\D/, "").to_i
      if count <= 0
        count = 1
      elsif count >8
        count = 8
      end
      news = (1..count.to_i).each_with_object([]) { |n, memo| memo << { title: '新闻标题', content: "第#{n}条新闻的内容#{n.hash}" } }
      request.reply.news(news) do |article, n, index| # 回复"articles"
        article.item title: "#{index} #{n[:title]}", description: n[:content], pic_url: 'http://www.baidu.com/img/bdlogo.gif', url: 'http://www.baidu.com/'
      end
    else
      request.reply.text "echo: #{content}" # Just echo
    end


  end

  # 当用户加关注
  on :event, with: 'subscribe' do |request|
    request.reply.text "User #{request[:FromUserName]} subscribe now"
  end

  # 当用户点击菜单时
  on :click, with: 'BOOK_LUNCH' do |request, key|
    request.reply.text "User: #{request[:FromUserName]} click #{key}"
  end

  # 处理图片信息
  on :image do |request|
    request.reply.image(request[:MediaId]) #直接将图片返回给用户
  end

  # 处理语音信息
  on :voice do |request|
    request.reply.voice(request[:MediaId]) #直接语音音返回给用户
  end

  # 处理地理位置消息
  on :label_location do |request|
    request.reply.text("Label: #{request[:Label]} Location_X: #{request[:Location_X]} Location_Y: #{request[:Location_Y]} Scale: #{request[:Scale]}")
  end

  # 处理上报地理位置事件
  on :location do |request|
    request.reply.text("Latitude: #{request[:Latitude]} Longitude: #{request[:Longitude]} Precision: #{request[:Precision]}")
  end

  # 成员进入应用的事件推送
  on :event, with: 'enter_agent' do |request|
    request.reply.text "#{request[:FromUserName]} enter agent app now"
  end

end
