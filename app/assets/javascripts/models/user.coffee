Foodlog.User = DS.Model.extend
  meals: DS.hasMany 'meal'
  email: DS.attr 'string'
  password: DS.attr 'string'
