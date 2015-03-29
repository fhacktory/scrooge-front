@app.controller 'ContactsCtrl', ($scope, $state, $stateParams, $http,ListsSrv,ContactsSrv) ->
  api = 'http://scrooge.reziga.eu/app_dev.php/api/'

  $scope.list = {id: 4}
  ListsSrv.list.id = 4
  ContactsSrv.init_contact $scope
  ContactsSrv.contacts_from_list $scope.list.id

  $scope.create_list_finsh_step_sheare = ->
    $state.go 'app.listnew_step_message'

  $scope.$on "load_contacts", (e, contacts) ->
    $scope.transpose_contacts(contacts)

  $scope.transpose_contacts = (contacts) ->
    for contact in contacts
      $scope.contacts.sync
        .push $scope.transpose_contact(contact)

  $scope.transpose_contact = (contact)->
    normal_contact =
      mail:   contact.email
      id:        contact.id

  $scope.add_contact = ->
    console.log 'touffu .com'
    contact     = $scope.contact
    contact_api =
      users:
        [contact.mail]
    url  = "#{api}shoplists/#{$scope.list.id}/sharedusers/adds"
    $http.post(url, contact_api).success((data) ->
      $scope.contacts.sync = []
      new_contacts = $scope.transpose_contacts data.shared_users
      $scope.contact = {}
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data


