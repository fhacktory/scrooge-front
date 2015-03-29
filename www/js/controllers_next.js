// Generated by CoffeeScript 1.7.1
(function() {
  this.app.controller('PosesCtrl', function($scope, $http) {
    var url;
    $scope.show_me = 'tutu';
    url = 'http://localhost:3003/secured_ping/ping';
    return $scope.call_rails = function() {
      console.log('call_rails');
      return $http.get(url).success(function(photos) {
        console.log('nope nope nope');
        return $scope.show_me = photos;
      }).error(function(data) {
        return console.log('nope nope nope');
      });
    };
  }).controller('LoginCtrl', function(store, $scope, $location, auth) {
    $scope.login = function() {
      auth.signin({
        authParams: {
          scope: 'openid profile offline_access',
          device: 'Mobile device'
        }
      }, (function(profile, token, accessToken, state, refreshToken) {
        store.set('profile', profile);
        store.set('token', token);
        store.set('refreshToken', refreshToken);
        $location.path('/');
      }), function() {});
    };
    return $scope.logout = function() {
      auth.signout();
      store.remove('profile');
      store.remove('token');
    };
  });

}).call(this);