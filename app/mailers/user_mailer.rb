class UserMailer < ApplicationMailer

  def send_msg_to_me(contact)
    @contact = contact
    mail(to: Settings.email.receive_email, subject: "留言通知")
  end

  def tell_me_service_info
  	mail(to: Settings.email.receive_email, subject: "服务器续费通知")
  end

  def fund_notification_msg
    if DateUtils.workday?(Date.current.strftime("%Y%m%d"))
      mail(from: "cc基金提醒服务 <17717045404@163.com>", to:Settings.email.fund_email,subject: "看基金啦!")
    end
  end
end
