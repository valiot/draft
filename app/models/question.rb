class Question < ApplicationRecord
  enum q_type: [:stars, :open]

  def input(name)
    if q_type == 'open'
      "<input type='text' name='#{name}' required>"
    elsif q_type == 'stars'
      "<div class='c-rating'><input type='hidden' value=0 name='#{name}' required></div>"
    else
      ""
    end
  end
end
