angular.module('app').factory 'Project', ($resource) ->
  class Project
    constructor: ->
      @service = $resource('/api/projects/:id',
        {id: '@id'},
        {update: {method: 'PUT'}})

    create: (project) ->
      @service.save(project)

    all: ->
      @service.query()

    update: (project) ->
      @service.update({id: project.id}, project)

    delete: (project) ->
      @service.delete {id: project.id}

