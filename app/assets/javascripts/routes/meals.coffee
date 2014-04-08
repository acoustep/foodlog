Foodlog.MealsIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'meal'

Foodlog.MealsShowRoute = Em.Route.extend
  serialize: (model) ->
    meal_id: model.get 'id'

Foodlog.MealsEditRoute = Em.Route.extend
  serialize:(model) ->
    meal_id: model.get 'id'

FoodlogMealsNewRoute = Em.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', {}
