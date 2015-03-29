@app.service 'ListsSrv', () ->

  list: {}

@app.directive 'ngEnter', ->
  (scope, element, attrs) ->
    element.bind 'keydown keypress', (event) ->
      if event.which == 13
        scope.$apply ->
          scope.$eval attrs.ngEnter, 'event': event
          return
        event.preventDefault()
      return
    return

@app.directive 'focusMe', ($timeout, $parse) ->
  { link: (scope, element, attrs) ->
    model = $parse(attrs.focusMe)
    scope.$watch model, (value) ->
      console.log 'value=', value
      if value == true
        $timeout ->
          element[0].focus()
          return
      return
    # to address @blesh's comment, set attribute value to 'false'
    # on blur event:
    element.bind 'blur', ->
      console.log 'blur'
      scope.$apply model.assign(scope, false)
      return
    return
 }

