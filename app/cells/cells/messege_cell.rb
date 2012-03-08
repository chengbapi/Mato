class MessegeCell < Cell::Rails

  helper   ApplicationHelper
  
  def show_messeges(opt)
    @user = opt[:user]
    @messeges = @user.received_messeges
    render
  end

end
