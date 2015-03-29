@app.service 'ItemSrv', ($http, ListsSrv, $rootScope) ->

  api = 'http://scrooge.reziga.eu/app_dev.php/api/'

  init_item: (scope) ->
    scope.current_item = {}
    scope.item = {}
    scope.items = {sync: []}
    $rootScope.$broadcast( "ping", 17 )

  items_from_list: (id) ->
    api = "http://scrooge.reziga.eu/app_dev.php/api/shoplists/"
    url = "#{api}#{id}"
    $http.get(url).success((data) ->
      $rootScope.$broadcast( "load_items", data.items )
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data
