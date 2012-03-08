#coding: utf-8
module ApplicationHelper
  def render_page_title
    title = @title
    content_tag("title",title,nil,false)
  end

  def show_flash
    [:notice, :alert, :error].collect do |key|
      content_tag(:div,"提示：" + flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
    end.join.html_safe
  end

  def user_tag(user=current_user)
    link_to(user.name,user_path(user)).html_safe
    
  end


end
