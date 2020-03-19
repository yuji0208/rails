module CommonActions
    extend ActiveSupport::Concern#共通した処理を切り出す
    
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
    !current_user.nil?
    end
end
