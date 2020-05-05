module UsersHelper
  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 80, additional_class: '' })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    additional_class = options[:additional_class]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar #{additional_class}")
  end
end
