# For more information see: http://emberjs.com/guides/routing/
Foodlog.Router.reopen
  location: 'history'

Foodlog.Router.map ->
  @resource 'meals', ->
    @route 'show', { path: '/:meal_id' }
    @route 'edit', { path: '/:meal_id/edit' }
    @route 'new'
  @resource 'posts', ->
    @route 'show', { path: '/:post_id' }
  @resource 'users', ->
    @route 'show', { path: '/:user_id' }
  @route 'sign-in'
