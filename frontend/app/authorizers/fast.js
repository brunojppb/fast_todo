import Ember from 'ember';
import Base from 'ember-simple-auth/authorizers/base';

export default Base.extend({

  session: Ember.inject.service('session'),

  authorize(data, block) {
    var token = this.get('session.content.secure.token');
    block('Authorization', data.token);
  }

});
