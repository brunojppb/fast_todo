import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('home', {path: '/'});
  this.route('login', {path: '/login'});

  this.route('todos', function() {
    this.route('new');
  });

  this.route('users', function() {
    this.route('signup');
    this.route('user', {
      path: '/user/:user_id'
    });
  });
});

export default Router;
