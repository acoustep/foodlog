Foodlog.UsersRoute = Em.Route.extend
  authRedirectable: true

Foodlog.UsersIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'user'

Foodlog.UsersShowRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get 'param'
