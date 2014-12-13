module ApplicationHelper
  def site_name
    "ToDo Rails Demo"
  end
  
  def site_url
    "http://github.com/stevegocoding"
  end
  
  def return_to_path(path)
    case path
    when '/', /^\/login/, /^\/signup/
      nil
    else
      path
    end
  end
end
