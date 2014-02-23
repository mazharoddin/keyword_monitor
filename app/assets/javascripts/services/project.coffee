angular.module('app').factory 'Project', ($resource, $routeParams) ->
  class Project
    constructor: ->
      @service = $resource('/api/projects/:id',
        {id: '@id'},
        {update: {method: 'PUT'}})

    create: (project) ->
      @service.save(project)

    all: ->
      @service.query()

    get: (id) ->
      @service.get(id: id)

    update: (project, attrs) ->
      @service.update({id: project.id}, attrs)

    delete: (project) ->
      @service.delete({id: project.id})
