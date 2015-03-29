@app.controller 'ColaborateCtrl', ($scope, $state, $stateParams, $http,ListsSrv,ItemSrv) ->
  api = 'http://scrooge.reziga.eu/app_dev.php/api/'
  $scope.list = {id: 4}
  ListsSrv.list.id = 4
  ItemSrv.init_item $scope
  ItemSrv.items_from_list $scope.list.id
  console.log 'auieauie'

  $scope.$on "ping", (e, count) ->
    console.log count

  $scope.$on "load_items", (e, items) ->
    for item in items
      $scope.items.sync
        .push $scope.transpose_item(item)

  $scope.transpose_item = (item)->
    normal_item =
      product:   item.name
      quantity:  item.quantity
      id:        item.id
      unity:     item.unit

  $scope.add_item = ->
    console.log 'touffu .com'
    item = $scope.item
    if item.product isnt null and item.quantity isnt null and item.unity
      item_api =
        item:
          name:      item.product
          quantity:  item.quantity
          shopList:  ListsSrv.list.id
          unit:      item.unity
      url  = "#{api}items/news"
      $http.post(url, item_api).success((data) ->
        new_item = $scope.transpose_item data
        $scope.items.sync.push new_item
        $scope.item = {}
      ).error (data) ->
        console.log 'nope nope nope'
        console.log data

  $scope.delete_item = (item) ->
    url  = "#{api}items/#{item.id}"
    $http.delete(url).success((data) =>
      cleaned_items = []
      for i in $scope.items.sync
        unless i.id+"" is item.id+""
          cleaned_items.push i
      $scope.items.sync = cleaned_items
    ).error (data) ->
      console.log 'nope nope nope'
      console.log data
