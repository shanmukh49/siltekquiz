module ApplicationHelper

def field_class(user, first_name)
  if user.errors[first_name]
    return "error".html_safe
  else
    return "".html_safe
  end
end

end
