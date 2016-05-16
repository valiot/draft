module ApplicationHelper
  def login_header
    if current_user
      raw '<li class="nav-item">
        <a class="nav-link" href="/user/edit">' + current_user&.name + '</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
      </li>'
    else
      raw '<li class="nav-item">
        <a class="nav-link" href="/login">Login</a>
      </li>'
    end
  end
end
