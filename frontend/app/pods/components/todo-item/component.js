import Ember from 'ember';

export default Ember.Component.extend({
  todo: null, //passed-in
  actions: {
    save() {
      let todo = this.get('todo');
      console.log('save() call in component.');
    }
  }
});
