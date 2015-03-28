@app.controller( 'PosesCtrl', ($scope, $http) ->
  $scope.show_me = 'tutu'
  url            = 'http://localhost:3003/secured_ping/ping'
  $scope.call_rails = ->
    console.log 'call_rails'
    $http.get(url).success((photos) ->
      console.log 'nope nope nope'
      $scope.show_me = photos
    ).error (data) ->
      console.log 'nope nope nope'

).controller( 'LoginCtrl', (store, $scope, $location, auth) ->

  $scope.login = ->
    auth.signin { authParams:
      scope: 'openid profile offline_access'
      device: 'Mobile device' }, ((profile, token, accessToken, state, refreshToken) ->
      # Success callback
      store.set 'profile', profile
      store.set 'token', token
      store.set 'refreshToken', refreshToken
      $location.path '/'
      return
    ), ->
      # Error callback
      return
    return

  $scope.logout = ->
    auth.signout()
    store.remove 'profile'
    store.remove 'token'
    return
)
