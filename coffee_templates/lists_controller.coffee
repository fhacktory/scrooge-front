@app.controller 'ListsCtrl', ($scope, $state, $stateParams, $http,ListsSrv) ->
  api = 'http://scrooge.reziga.eu/app_dev.php/api/'
  $scope.create_list = ->
    $state.go 'app.listnew_step_0'

  $scope.list = {id: 4}

  $scope.show_me = ->
    console.log $scope.list
    console.log ListsSrv.toto
    console.log ListsSrv.list

  $scope.create_list_step_0 = ->
    console.log 'hééhéh'
    url  = "#{api}shoplists/news"
    console.log $scope.list.title
    console.log $scope
    list =
      shoplist:
        serialname:   $scope.list.title
        description:  $scope.list.description
        guestname:    $scope.list.user
        guestemail:   $scope.list.email
    $http.post(url, list).success((data) ->
      console.log data
      ListsSrv.list = data
      $state.go 'app.listnew_step_1'
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data

  # la ou on ajoute les item
  #
  #
  $scope.create_list_finsh_step_items = ->

    $state.go 'app.listnew_step_sheare'



  $scope.create_list_finsh_step_sheare = ->
    $state.go 'app.listnew_step_message'
  $scope.create_list_finsh_step_message = ->
    $state.go 'app.listnew_step_confirm_message'

@app.service 'ListsSrv', () ->

  list: {}
