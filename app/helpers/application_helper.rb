module ApplicationHelper
  def login_header
    return "<li class='nav-item'><a class='nav-link' href='/user/edit'>#{current_user&.name}</a></li>
    <li class='nav-item'><a class='nav-link' href='/logout'>Logout</a></li>".html_safe if current_user

    "<li class='nav-item'><a class='nav-link' href='/login'>Login</a></li>".html_safe
  end
end
