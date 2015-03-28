angular.module('starter.controllers', []).controller('AppCtrl', ($scope, $ionicModal, $timeout) ->
  # Form data for the login modal
  $scope.loginData = {}
  # Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', scope: $scope).then (modal) ->
    $scope.modal = modal
    return
  # Triggered in the login modal to close it

  $scope.closeLogin = ->
    $scope.modal.hide()
    return

  # Open the login modal

  $scope.login = ->
    $scope.modal.show()
    return

  # Perform the login action when the user submits the login form

  $scope.doLogin = ->
    console.log 'Doing login', $scope.loginData
    # Simulate a login delay. Remove this and replace with your login
    # code if using a login system
    $timeout (->
      $scope.closeLogin()
      return
    ), 1000
    return

  return
).controller('PlaylistsCtrl', ($scope, $http) ->
  url = 'http://scrooge.reziga.eu/app_dev.php/api/users/admin/salt'
  #url = 'http://localhost:3003/api/photos/all'
  #url = 'https://garden-models.herokuapp.com/api/photos/all'
  $http.get(url).success((photos) ->
    $scope.photos = photos
    return
  ).error (data) ->
    console.log 'nope nope nope'
    return
  url = 'http://scrooge.reziga.eu/app_dev.php/api/users/admin/salt'
  $http.get(url).success((data) ->
    console.log data
    $scope.salt = data.salt
    return
  ).error (data) ->
    console.log 'nope nope nope'
    return
  $scope.playlists = [
    {
      title: 'Reggae'
      id: 1
    }
    {
      title: 'Chill'
      id: 2
    }
    {
      title: 'Dubstep'
      id: 3
    }
    {
      title: 'Indie'
      id: 4
    }
    {
      title: 'Rap'
      id: 5
    }
    {
      title: 'Cowbell'
      id: 6
    }
  ]
  return
).controller( 'PlaylistCtrl', ($scope, $stateParams) ->

).controller( 'PosesCtrl', ($scope, $http) ->
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
