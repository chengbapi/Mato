#coding: utf-8
class Identity < ActiveRecord::Base
  #身份模版
  def self.categories
    IdentityData.identity_categories.map{ |k,v| [I18n.t("identity_categories.#{k}"),v] }
  end

end
class IdentityData < Settingslogic
  source "#{Rails.root}/config/Identity.yml"
  namespace Rails.env
end

