require 'spec_helper'

describe 'Keyword flows' do
  describe 'Create a new keyword' do
    let!(:project) { create(:project) }

    before do
      post "/api/projects/#{project.id}/keywords", keyword: {name: 'term'}

      @status        = response.status
      @response_json = JSON.parse(response.body)
    end

    it { expect(@status).to eq(201) }
    it { expect(@response_json).to include(
      'name'       => 'term',
      'project_id' => project.id)}
  end
end
