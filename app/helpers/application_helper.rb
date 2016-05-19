module ApplicationHelper
  def logout_header
    return "<a class='btn btn-danger-outline' href='/logout'>Logout</a>".html_safe if current_user
  end

  def pending_invitations_header
    link_to 'Invitaciones pendientes', invitations_path, class: 'btn btn-primary-outline' if current_user&.pending_invitations?
  end
end
