import Ember from 'ember';
import Base from 'ember-simple-auth/authenticators/base';
import request from 'ic-ajax';

export default Base.extend({

  tokenEndPoint: 'http://localhost:3000/api/sessions',

  restore: function(data) {
    return new Ember.RSVP.Promise(function(resolve, reject){
      if(!Ember.isEmpty(data.token)) {
        resolve(data);
      } else {
        reject();
      }
    });
  },

  authenticate: function(options) {
    return new Ember.RSVP.Promise((resolve, reject) => {
      Ember.$.ajax({
        url: this.tokenEndPoint,
        type: 'POST',
        crossDomain: true,
        data: JSON.stringify({
          session: {
            email:    options.session.email,
            password: options.session.password
          }
        }),
        contentType: 'application/json'
        // dataType: 'json'
      }).then(function(response){
        console.log('LOGIN OK: ' + response.auth_token);
        Ember.run(function(){
          resolve({
            token: response.auth_token
          });
        });
      }, function(xhr, status, error) {
        console.log('LOGIN ERROR: ' + xhr.responseText);
        var response = xhr.responseText;
        Ember.run(function(){
          reject(response);
        });
      });
    });
  },

  invalidate: function() {
    console.log('Invalidate Session....');
    return Ember.RSVP.resolve();
  }

});
