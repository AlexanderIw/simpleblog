module SessionsHelper
    def log_in(user)
        session[:user_id]=user.id       #session helpermethods create temp. encrypted cookie
    end

    def remember(user)
        user.remember_digest_update   #assigning and encrypting remember_token to the DB
        #cookies[:user_id]={value: user.id, expires:20.years.from_now.utc20.} #long hand
        cookies.permanent.signed[:user_id]=user.id   #signe,creates-> encrypted permanent cookie of user_id
        cookies.permanent[:remember_token]=user.remember_token
    end
        
    #memoization - remember value of user so we dont hit the db repeatedly
    def current_user
        user_id=session[:user_id]  #get the login user session id
        if (user_id)    
            @current_user ||=User.find_by(id: user_id) 
        elsif (cookies.signed[:user_id]) #if not nil there is persistent sessions 
            #raise
            user= User.find_by(id: cookies.signed[:user_id]) 
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user=user
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    #forgets a perisitent session.
    def forget(user)
        user.forget_digest_update
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    #logout the current user
    def log_out
        forget(current_user)
        session.delete(:user_id) #same as session[:user_id]= nil )
        @current_user=nil
    end
end
