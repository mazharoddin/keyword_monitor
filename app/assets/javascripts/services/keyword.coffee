angular.module('app').factory 'Keyword', ($resource) ->
  class Keyword
    constructor: (projectId) ->
      @service = $resource('/api/projects/:projectId/keywords/:id',
        {
          projectId: projectId,
          id:        '@id'},
        {
          update:          {method: 'PUT'},
          updatePositions: {method: 'GET', url: '/api/projects/:projectId/keywords/update_positions'}
        })

    create: (attrs) ->
      @service.save(attrs)

    all: ->
      @service.query()

    delete: (keyword) ->
      @service.delete id: keyword.id

    updatePositions: ->
      @service.updatePositions()

