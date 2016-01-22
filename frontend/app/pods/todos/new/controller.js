import Ember from 'ember';

export default Ember.Controller.extend({

  actions: {
    save() {
      this.get('model').save().then((response) => {
        this.transitionToRoute('todos');
      }).catch((error) => {
        console.log('ERROR Saving todo.');
      });
    }
  }

});
