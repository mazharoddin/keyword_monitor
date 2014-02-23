angular.module('app').controller 'ProjectCtrl', ($scope, Project) ->
  $scope.init = () ->
    @service        = new Project
    $scope.projects = @service.all()

  $scope.create = ->
    project = @service.create($scope.project)
    $scope.projects.push project
    $scope.project = {}

  $scope.update = (project) ->
    @service.update project, {name: project.name, url: project.url}

  $scope.delete = (project) ->
    @service.delete project
    $scope.projects.remove(project)

