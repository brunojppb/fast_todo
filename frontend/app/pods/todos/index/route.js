import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {

  model() {
    return this.store.findAll('todo');
  },

  actions: {
    delete(todo) {
      console.log('CATCH DELETE');
      todo.destroyRecord().then((success) => {
        console.log('TODOS#INDEX delete model SUCCESS');
      }).catch((error) => {
        console.log('TODOS#INDEX delete model ERROR');
      });
      return false;
    }
  }

});
