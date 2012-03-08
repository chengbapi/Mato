class UserCell < Cell::Rails

  helper   ApplicationHelper
  
  def recommended_users(opts)
    current_user = opts[:current_user]
    @users = User.find(:all,:limit => 35,:order => 'RAND()')
    @repeated = User.find(current_user.all_relationships)
    @recommended_users = (@users - @repeated)[0..4]
    render
  end

  def last_visitors
    render
  end

  def owner_news(opts)
    @user = opts[:user]
    @feed_news = @user.news.order('created_at DESC').all
    render :view => "recent_news"
    
  end

  def recent_news(opts)
   @user = opts[:user]
  @feed_news = News.where(:user_id => @user.friends.push(@user)).order('created_at DESC')
   render
  end

  def recent_visited(opts)
    @user = opts[:user]
    @visited_users = @user.visited_list
    render
  end
  
  def recent_visitor(opts)
    @user = opts[:user]
    @visitors = @user.visitor_list
    render
  end
end
