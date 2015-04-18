class TutorialsController < ApplicationController
    
  #before_filter :authorize, only: [:new,:edit] 
  before_filter :authorize, only: [:new] 
  before_filter :correct_user, only: [:edit, :update]
  
  def index
    @tutorials = Tutorial.all
  end
  
  def new
    @tutorial = Tutorial.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    user.tutorials.create(params.require(:tutorial).permit(:title,:description))
    redirect_to tutorials_path , notice: "Tutorial added!"
  end
  
  def destroy    
    Tutorial.find(params[:id]).destroy        
    redirect_to tutorials_path , notice: "Tutorial destroyed!"  
  end
  
  def edit    
    @tutorial = Tutorial.find(params[:id]) 
    #render text: "we're trying to edit"
  end  

  def update    
    t = Tutorial.find(params[:id])        
    t.update(title: params[:title], title: params[:description])  
    
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  
  def show_user_tutorials
    if session[:user_id]
      @user_tutorials = User.find(session[:user_id]).tutorials
    else
      render new_session_path
    end
  end
end
