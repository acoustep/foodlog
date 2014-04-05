Foodlog.Meal = DS.Model.extend
  user: DS.belongsTo 'user'
  name: DS.attr 'string'
  quantity: DS.attr 'string'
  time: DS.attr 'string'
