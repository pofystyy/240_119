module Sorcery
  module TestHelpers
    module Rails
      module Request
        def login_user(user = nil, password = '123456', route = nil, http_method = :post)
          user ||= @user
          route ||= user_sessions_url

          send(http_method, route, params: { email: @user.email, password: password })
        end
      end
    end
  end
end
