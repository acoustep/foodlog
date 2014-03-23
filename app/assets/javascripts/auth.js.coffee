Foodlog.Auth = Em.Auth.extend
  require:  'jquery'
  response: 'json'
  strategy: 'token'
  session:  'cookie'

  modules: [
    'emberData'
    'authRedirectable'
    'actionRedirectable'
    'rememberable'
  ]

  rememberable:
    tokenKey: 'remember_token'
    period: 7
    autoRecall: true

  authRedirectable:
    route: 'sign-in'

  signInEndPoint:  '/api/sign_in'
  signOutEndPoint: '/api/sign_out'
  tokenKey:        'auth_token'
  tokenIdKey:      'user_id'
  tokenLocation:   'param'

  emberData:
    userModel: 'user'

  actionRedirectable:
    signInRoute: 'users'
    signInSmart: true
    signInBlacklist: ['sign-in']
    signOutRoute: 'posts'
