import Ember from 'ember';

export default Ember.Route.extend({

  model() {
    return this.store.createRecord('user');
  },

  actions: {
    save() {
      var model = this.modelFor('users/signup');
      model.save().then(() => {
        this.transitionTo('home');
      });
    }
  }

});
