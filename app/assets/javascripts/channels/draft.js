App.draft = App.cable.subscriptions.create('DraftChannel', {
  connected: function() {
    return console.log('me conecte');
  },
  received: function(data) {
    switch (data.action) {
      case "update_draft":
        return $('#team-'+data.team_id).append($('#waiting-' + data.user_id));
      case "create_attendee":
        return $('#waiting_list').append('<li id="waiting-' + data.user_id + '" class="list-group-item draft-team-list"><img class="img-circle img-fluid" src="' + data.picture_url + '" alt="500x500?text=profile+picture"><h6 class="card-title">' + data.name + '</h6></li>');
      case "update_turn":
        if ($('#choose_problems')) {
          return true;
        }else {
          return Turbolinks.visit(window.location.toString());
        }
    }
  }
});
