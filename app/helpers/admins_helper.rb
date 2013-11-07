module AdminsHelper

# Define Devise methods and variable names so we can display Devise forms in other controllers
  def resource_name
    :admin
  end

  def resource
    @resource ||= Admin.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end

end
