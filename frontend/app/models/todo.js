import DS from 'ember-data';

export default DS.Model.extend({
  title:      DS.attr('string'),
  body:       DS.attr('string'),
  completed:  DS.attr('boolean'),
  remember:   DS.attr('boolean'),
  dueDate:    DS.attr('date'),
  createdAt:  DS.attr('date'),
});
