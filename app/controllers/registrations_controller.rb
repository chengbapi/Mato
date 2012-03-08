class RegistrationsController < Devise::RegistrationsController
  layout false ,:only => :new
end
