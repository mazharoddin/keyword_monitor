# The main application module.
app = angular.module('app', ['ngResource'])

# To make forms work in AngularJS.
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# In Rails 4 the PATCH method is not supported by ngResource by default.
# It will ensure any PATCH requests are made with application/json content type.
defaults = $http.defaults.headers
defaults.patch = defaults.patch || {}
defaults.patch['Content-Type'] = 'application/json'

# This will make sure the AngularJS application is properly initialized each
# time a turbolink does its fetch&replace magic.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
