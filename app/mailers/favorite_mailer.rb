
class FavoriteMailer < ActionMailer::Base
  default from: "joshua.lohrenz@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@yjosh-bloccit2.example>"
    headers["In-Reply-To"] = "<post/#{@post.id}@josh-bloccit2.example>"
    headers["References"] = "<post/#{@post.id}@josh-bloccit2.example>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
