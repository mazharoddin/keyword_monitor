class API::KeywordsController < InheritedResources::Base
  respond_to :json
  belongs_to :project

  def update_positions
    RetrievePositionsJob.new.async.perform
    render nothing: true
  end

private

  def permitted_params
    params.permit(keyword: [:name])
  end
end
