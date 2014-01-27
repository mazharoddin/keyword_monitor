angular.module('app').factory 'Project', ($resource) ->
  class Project
    constructor: ->
      @service = $resource('/api/projects/:id',
        {id: '@id'},
        {update: {method: 'PUT'}})

    create: (attrs) ->
      new @service(project: attrs).$save (project) -> attrs.id = project.id
      attrs

    all: ->
      @service.query()

    update: (project, attrs) ->
      new @service(project: attrs).$update {id: project.id}

