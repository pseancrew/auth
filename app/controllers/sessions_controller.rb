class SessionsController < ApplicationController

    def new
        
    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]
        @user = User.find_by({email: entered_email})
        if @user # yes, email in database
            #check password
            if BCrypt::Password.new(@user.password) == entered_password
                session["user_id"] = @user.id
                flash[:notice] = "Welcome!!"
                redirect_to "/companies"
                # happy path
            else
                #pass doesn't match
                flash[:notice] = "password is WRONG"
                redirect_to "/sessions/new"
            end
        else
            #email doesn't match, send back to login page
            redirect_to "/sessions/new"   
        end

    end

    def destroy 
        


end
