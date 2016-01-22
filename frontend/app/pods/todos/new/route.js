import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {

  model() {
    return this.store.createRecord('todo');
  },

  // Reset the controller values either when the model changes
  // or route is exiting
  resetController: function(controller, isExiting, transition){
    if(isExiting) {
      console.log(' --------- ResetController hook called ------');
      let model = controller.get('model');
      // check if the model is in "isNew" state, which means it wasn't save
      // to the backend
      if(model.get('isNew')) {
        // call DS#destroyRecord() which removes it from the store
        console.log(' --------- Destroying  ------');
        model.destroyRecord().then((success) => {
          console.log('SUCCESS DELETE TODO');
        }).catch((response) => {
          model.unloadRecord();
          console.log('ERROR DELETE TODO');
        });
      }

    } else {
      console.log('--------- ResetController model changes');
    }
  }

});
