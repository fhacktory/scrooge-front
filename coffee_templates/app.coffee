# Ionic Starter App
# angular.module is a global place for creating, registering and retrieving Angular modules
# 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
# the 2nd parameter is an array of 'requires'
# 'starter.controllers' is found in controllers.js
#  'starter.services',
# 'auth0',
#'angular-storage',
#  'angular-jwt'
angular.module('starter', [
  'ionic'
  'starter.controllers',
]).run(($ionicPlatform) ->
  $ionicPlatform.ready ->
    # Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    # for form inputs)
    if window.cordova and window.cordova.plugins.Keyboard
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
    if window.StatusBar
      # org.apache.cordova.statusbar required
      StatusBar.styleDefault()
    return
  return
#).config(($stateProvider, $urlRouterProvider  , authProvider, $httpProvider, jwtInterceptorProvider             ) ->
).config(($stateProvider, $urlRouterProvider  , $httpProvider) ->
  $stateProvider.state('app',
    url: '/app'
    abstract: true
    templateUrl: 'templates/menu.html'
    controller: 'AppCtrl'
  ).state('app.search',
    url: '/search'
    views: 'menuContent': templateUrl: 'templates/search.html'
  ).state('app.browse',
    url: '/browse'
    views: 'menuContent': templateUrl: 'templates/browse.html'
  ).state('app.playlists',
    url: '/playlists'
    views: 'menuContent':
      templateUrl: 'templates/playlists.html'
      controller: 'PlaylistsCtrl'
  ).state('app.single',
    url: '/playlists/:playlistId'
    views: 'menuContent':
      templateUrl: 'templates/playlist.html'
      controller: 'PlaylistCtrl'

  # Scrooge Home
  ).state('app.listnew',
    url: '/listnew'
    views: 'menuContent':
      templateUrl: 'templates/listnew.html'
      controller:  'ListsCtrl'
  ).state('app.listnew_step_0',
    url: '/listnew_step_0'
    views: 'menuContent':
      templateUrl: 'templates/create_list_step_0.html'
      controller:  'ListsCtrl'
  ).state('app.listnew_step_1',
    url: '/listnew_step_1'
    views: 'menuContent':
      templateUrl: 'templates/create_list_step_1.html'
      controller:  'ListsCtrl'
  ).state('app.listnew_step_sheare',
    url: '/listnew_step_sheare'
    views: 'menuContent':
      templateUrl: 'templates/create_list_step_sheare.html'
      controller:  'ListsCtrl'
  ).state('app.listnew_step_message',
    url: '/listnew_step_message'
    views: 'menuContent':
      templateUrl: 'templates/create_list_step_message.html'
      controller:  'ListsCtrl'
  ).state('app.listnew_step_confirm_message',
    url: '/listnew_step_confirm_message'
    views: 'menuContent':
      templateUrl: 'templates/create_list_step_confirm_message.html'
      controller:  'ListsCtrl'
  )
  ###
  authProvider.init
    domain: 'garden-model.auth0.com'
    clientID: 'YzFwJpiJrxePpXFUfsswsKA8ezpq0xhW'
    loginState: 'login'


  # ...

  jwtInterceptorProvider.tokenGetter = (store, jwtHelper, auth) ->
    idToken = store.get('token')
    refreshToken = store.get('refreshToken')
    # If no token return null
    if !idToken or !refreshToken
      return null
    # If token is expired, get a new one
    if jwtHelper.isTokenExpired(idToken)
      auth.refreshIdToken(refreshToken).then (idToken) ->
        store.set 'token', idToken
        idToken
    else
      idToken

  $httpProvider.interceptors.push 'jwtInterceptor'
  # ...

  # ---



  # if none of the above states are matched, use this as the fallback
  ###
  $urlRouterProvider.otherwise '/app/listnew'
  return
)
###
).run (auth) ->
    # This hooks all auth events to check everything as soon as the app starts
    auth.hookEvents()
###

