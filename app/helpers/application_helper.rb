module ApplicationHelper
  def logout_header
    return "<li class='nav-item vertical-align'>
              <a class='btn btn-danger-outline' href='/logout'>Logout</a>
            </li>".html_safe if current_user
  end
end
