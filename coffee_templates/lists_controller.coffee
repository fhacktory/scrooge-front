@app.controller 'ListsCtrl', ($scope, $state, $stateParams) ->
  $scope.create_list = ->
    $state.go 'app.listnew_step_0'
    console.log 'hééhéh'
  $scope.create_list_step_0 = ->
    $state.go 'app.listnew_step_1'
  $scope.create_list_finsh_step_items = ->
    $state.go 'app.listnew_step_sheare'
  $scope.create_list_finsh_step_sheare = ->
    $state.go 'app.listnew_step_message'
  $scope.create_list_finsh_step_message = ->
    $state.go 'app.listnew_step_confirm_message'
