angular.module('app').controller 'KeywordCtrl', ($scope, $routeParams, Keyword, Project) ->
  $scope.init = () ->
    @projectService = new Project
    @service        = new Keyword($routeParams.id)

    $scope.project  = @projectService.get($routeParams.id)
    $scope.keywords = @service.all()

  $scope.create = ->
    keyword = @service.create($scope.keyword)
    $scope.keywords.push keyword
    $scope.keyword = {}

  $scope.delete = (keyword) ->
    @service.delete keyword
    $scope.keywords.remove(keyword)

  $scope.updatePositions = ->
    @service.updatePositions()
    $scope.isUpdatingPositions = true

