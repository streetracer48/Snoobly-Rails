class SessionsController <ApplicationController


    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id

           flash[:success] ="Logged in succesfully"
           redirect_to user_path(user)
        else 
            flash.now[:danger] = "there was something wrong with your email or passwor"
             render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logout successfully"
        redirect_to root_path

    end

end