Foodlog.PostsIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'post'

Foodlog.PostsShowRoute = Em.Route.extend
  serialize: (model) ->
    post_id: model.get 'param'
