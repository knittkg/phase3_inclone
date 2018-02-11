class PostpictMailer < ApplicationMailer
def postpict_mail(postpict)
  @postpict = postpict
  mail to: @postpict.user.email, subject: "写真投稿完了メール"
end
end
