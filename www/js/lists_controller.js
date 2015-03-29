// Generated by CoffeeScript 1.7.1
(function() {
  this.app.controller('ListsCtrl', function($scope, $state, $stateParams, $http, ListsSrv, ItemSrv) {
    var api;
    api = 'http://scrooge.reziga.eu/app_dev.php/api/';
    $scope.create_list = function() {
      return $state.go('app.listnew_step_0');
    };
    $scope.list = {
      id: 4
    };
    ListsSrv.list.id = 4;
    ItemSrv.init_item($scope);
    $scope.$on("ping", function(e, count) {
      return console.log(count);
    });
    $scope.create_list_finsh_step_items = function() {
      return $state.go('app.listnew_step_sheare');
    };
    $scope.create_list_finsh_step_sheare = function() {
      return $state.go('app.listnew_step_message');
    };
    $scope.create_list_finsh_step_message = function() {
      return $state.go('app.listnew_step_confirm_message');
    };
    $scope.show_me = function() {
      console.log($scope.list);
      console.log(ListsSrv.toto);
      return console.log(ListsSrv.list);
    };
    return $scope.create_list_step_0 = function() {
      var list, url;
      url = "" + api + "shoplists/news";
      list = {
        shoplist: {
          serialname: $scope.list.title,
          description: $scope.list.description,
          guestname: $scope.list.user,
          guestemail: $scope.list.email
        }
      };
      return $http.post(url, list).success(function(data) {
        console.log(data);
        ListsSrv.list = data;
        return $state.go('app.listnew_step_1');
      }).error(function(data) {
        console.log('nope nope nope');
        return console.log(data);
      });
    };
  });

}).call(this);