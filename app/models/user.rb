#coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,
                  :name, :identity, :birthday, :gender

  # friends relations

  has_many :friendships
  has_many :requested_friendships, :class_name => 'Friendship', :foreign_key => :friend_id

  has_many :direct_friends,  :through => :friendships, :conditions => ['approved = ? ',true], :source => :user
  has_many :inverse_friends, :through => :requested_friendships, :source => :user, :conditions => ['approved = ? ', true]

  has_many :requested_friends, :source => :user, :through => :requested_friendships, :conditions => ['approved = ?',false]
  has_many :pending_friends, :through => :friendships, :conditions => ['approved = ? ',false], :source => :user




  def all_relationships
    relations =  Friendship.where(:friend_id => self.id).all.collect(&:user_id) + 
    friendships.all.collect(&:friend_id)
    relations.push(self.id)
  end

  def friends
    direct_friends | inverse_friends
  end

  def find_any_friendship_with(user)
    friendship = Friendship.where(:user_id => self.id, :friend_id => user.id).first
    if friendship.nil?
      friendship = Friendship.where(:user_id => user.id, :friend_id => self.id ).first
    end
    friendship
  end

  def invite(user)
    return false if user == self || find_any_friendship_with(user)
    Friendship.create!(:user_id => self.id, :friend_id => user.id)
  end

  def approve(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil? || invited?(user)
    friendship.update_attribute(:approved,true)
  end

  def common_friends_with(user)
    friends & user.friends
  end

  def invited?(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil?
    friendship.friend == user
  end

  def invited_by?(user)
    friendship = find_any_friendship_with(user)
    return false if friendship.nil?
    friendship.user == user
  end

  def friend_with?(user)
    friends.include?(user)
  end

  def total_friend_count
    friends.length
  end

  

  has_one :last_post_news, :class_name => 'News', :order => 'created_at DESC'

  has_many :news, :dependent => :destroy

  # messages & notifications

  has_many :notifications

  
  def unread_notifications
    notifications.unread
  end


  def read_notifications(notices)
    note_ids = notices.map(&:id)
    if note_ids.any?
      Notification.where({
        :id  => note_ids,
        :read    => false
        }).update_all(:read => true)
    end
  end

  # messeges
  has_many :send_messeges, :class_name => 'Messege'
  has_many :received_messeges, :class_name => "Messege", :foreign_key => :receiver_id

  # replies 
  has_many :replies
  has_many :news_replies , :through => :news , :source => :replies
  has_many :send_messeges_replies, :through => :send_messeges , :source => :replies
  has_many :received_messeges_replies, :through => :received_messeges , :source => :replies

  def messege_replies
    send_messeges_replies + received_messeges_replies
  end

  #visitor
  has_many :visitor_records, :class_name => 'VisitRecord', :foreign_key => :visit_id
  has_many :visit_records    

  def visit(user)
    visitor = self
    if visitor.visit_records.where(:visit_id => user.id).all.empty?
      visitor.visit_records.create(:visit_id => user.id)
    else
      visitor.visit_records.where(:visit_id => user.id).first.touch
    end
    
  end
  
  def visitor_list
    visitor_records.order(:updated_at).limit(40)
  end

  def visited_list
    visit_records.order(:updated_at).limit(40)
  end

=begin
  #visitors 决定还是先用数据库存，这些代码先不用了。
  def visit(user)
    visitor = self
    visitor.recent_visited_record_update(user)
    user.recent_visitor_record_update(visitor)

    end

  def recent_visitor_record_update(visitor) 
    visit_record = [visitor,Time.now]
    begin 
      visitor_list = Marshal.load(recent_visitor)
    rescue
      recent_visitor = Marshal.dump([].push(visit_record))
      return
    end
    visitor_list.add_visit_record(visit_record)
  end
  
  def recent_visited_record_update(user) 
   visit_record = [user,Time.now]
    begin
      visited_list = Marshal.load(recent_visited)
    rescue 
       recent_visited = Marshal.dump([].push(visit_record))
       return
    end
    visited_list.add_visit_record(visit_record) 
  end
=end
  
  
  #article
  has_many :articles
  has_many :galleries
  has_many :photos, :through => :galleries

end
