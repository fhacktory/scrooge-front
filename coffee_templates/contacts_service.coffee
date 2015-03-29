@app.service 'ContactsSrv', ($http, $rootScope) ->

  api = 'http://scrooge.reziga.eu/app_dev.php/api/'

  init_contact: (scope) ->
    scope.current_contact = {}
    scope.contact = {}
    scope.contacts = {sync: []}
    #$rootScope.$broadcast( "ping", 17 )

  contacts_from_list: (id) ->
    api = "http://scrooge.reziga.eu/app_dev.php/api/shoplists/"
    url = "#{api}#{id}"
    $http.get(url).success((data) ->
      $rootScope.$broadcast( "load_contacts", data.shared_users )
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data
