require File.expand_path('../boot', __FILE__)

module SampleApp
  class Application < Rails::Application
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
