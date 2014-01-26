class API::KeywordsController < InheritedResources::Base
  respond_to :json
  belongs_to :project

private

  def permitted_params
    params.permit(keyword: [:name])
  end
end
