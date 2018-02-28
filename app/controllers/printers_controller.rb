class PrintersController < ApplicationController

  def print
    @event = Event.find_by('starts_at > ? and ?< finishes_at', Date.today, Date.today)
  end

end
