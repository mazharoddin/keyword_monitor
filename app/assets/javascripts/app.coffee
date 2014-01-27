# The main application module.
app = angular.module('app', ['ngResource', 'xeditable'])

# To make forms work in AngularJS.
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.run (editableOptions) ->
  editableOptions.theme = 'bs3'

# This will make sure the AngularJS application is properly initialized each
# time a turbolink does its fetch&replace magic.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
