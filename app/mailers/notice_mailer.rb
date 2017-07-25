class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_inst.subject
  #
  def sendmail_inst(inst)
    @inst = inst

    mail to: "ny_bigapplejr@yahoo.co.jp",
         subject: 'インスタ投稿！！'
  end
end
