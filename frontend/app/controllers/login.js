import Ember from 'ember';

export default Ember.Controller.extend({

  session: Ember.inject.service('session'),

  authenticator: 'authenticator:fast',
  actions: {
    authenticate: function() {
      var credentials = {
        session: {
          email: this.get('email'),
          password: this.get('password')
        }
      };
      this.get('session').authenticate('authenticator:fast', credentials).then(function(response){

      }).catch((message) => {
        console.log("ERROR message: " + message);
        this.set('errorMessage', message);
      });
    }
  }

});
