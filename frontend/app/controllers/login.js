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
    },

    createUser: function() {
      var firstName             = this.get('firstName');
      var lastName              = this.get('lastName');
      var newEmail              = this.get('newEmail');
      var newPassword           = this.get('newPassword');
      var passwordConfirmation  = this.get('passwordConfirmation');

      var user = this.store.createRecord('user', {
        firstName:            firstName,
        lastName:             lastName,
        email:                newEmail,
        password:             newPassword,
        passwordConfirmation: passwordConfirmation
      });

      user.save();

      // Stop bubbling
      return false;
    }
  }

});
