class ApplicationController < ActionController::API
    before_action :authorized
    protect_from_forgery
    before_filter :cors_preflight_check
    after_filter :cors_set_access_control_headers

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
      headers['Access-Control-Max-Age'] = "1728000"
    end
    
    def cors_preflight_check
      if request.method == "OPTIONS"
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
        headers['Access-Control-Max-Age'] = '1728000'
        render :text => '', :content_type => 'text/plain'
      end
    end

    def secret
        Rails.application.credentials[:jwt_secret]
    end

    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, secret)
    end
     
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end
     
    def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, secret, true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
    end
     
    def current_user
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
    end
     
    def logged_in?
        !!current_user
    end
     
    def authorized
        render json: {  :errors => @user.errors.full_messages  }, status: :unauthorized unless logged_in?
    end
end
