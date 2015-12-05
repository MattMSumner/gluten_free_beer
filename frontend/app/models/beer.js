import DS from 'ember-data';

export default DS.Model.extend({
  abv: DS.attr('number'),
  description: DS.attr(),
  name: DS.attr(),
  nameDisplay: DS.attr(),
  styleDescription: DS.attr(),
  styleName: DS.attr(),
  styleShortName: DS.attr(),
  isOrganic: DS.attr('boolean'),
});
