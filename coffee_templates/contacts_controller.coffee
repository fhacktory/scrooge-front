@app.controller 'ContactsCtrl', ($scope, $state, $stateParams, $http,ListsSrv) ->
  api = 'http://scrooge.reziga.eu/app_dev.php/api/'

  $scope.list = {id: 4}
  ListsSrv.list.id = 4

  $scope.create_list_finsh_step_sheare = ->
    $state.go 'app.listnew_step_message'

  $scope.add_contact = ->
    console.log 'touffu .com'
    contact     = $scope.contact
    contact_api =
      users:
        [contact.mail]
    url  = "#{api}shoplists/#{$scope.list.id}/sharedusers/adds"
    $http.post(url, contact_api).success((data) ->
      console.log data
      #new_contact = $scope.transpose_contact data
      #$scope.contacts.sync.push new_contact
      #$scope.contact = {}
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data


