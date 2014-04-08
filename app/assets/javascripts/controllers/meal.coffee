Foodlog.MealsEditController = Em.ObjectController.extend
  setupController: (controller, meal) ->
    controller.set('model', meal)
  actions:
    update: ()->
      alert 'hello'
    cancel: ()->
      alert 'cancel'

Foodlog.MealsNewController = Em.ObjectController.extend
  setupController: (controller, model) ->
    controller.set 'content', {}
  content: null
  name: null
  time: null
  quantity: null
  # user_id: @auth.get 'userId'
  actions:
    submitForm: (event) ->
      Foodlog.Meal.createRecord @content
      @transitionToRoute 'meals.index'

