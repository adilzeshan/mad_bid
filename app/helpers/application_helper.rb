module ApplicationHelper
	# work around to display sign in form on homepage
	# alternatively create a partial _form.erb in devise view
	# and render it
	def resource_name
    :user
  end
  def resource
    @resource ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
