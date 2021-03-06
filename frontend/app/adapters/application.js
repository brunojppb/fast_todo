// import ActiveModelAdapter from 'active-model-adapter';
import DS from 'ember-data';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

export default DS.JSONAPIAdapter.extend(DataAdapterMixin, {
  authorizer:  'authorizer:fast',
  namespace:   'api',
  host:        'http://localhost:3000',
  headers: {
    'Content-Type': 'application/json'
  }
});
