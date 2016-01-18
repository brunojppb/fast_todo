import Ember from 'ember';

export function initialize(ApplicationInstance) {
  Ember.$.material.init();
  console.log(Ember.$.material);
}

export default {
  name: 'materialdesign',
  initialize: initialize
};
