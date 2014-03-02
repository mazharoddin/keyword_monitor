require 'spec_helper'

describe 'Keyword flows' do
  describe 'Create a new keyword' do
    let!(:project) { create(:project) }

    before do
      post "/api/projects/#{project.id}/keywords", keyword: {name: 'term'}
    end

    it { expect(status).to eq(201) }

    it { expect(json_response).to include(
      'name'       => 'term',
      'project_id' => project.id)}
  end

  describe 'Request a collection as JSON' do
    let!(:keyword)     { create(:keyword) }

    before do
      xhr :get, "/api/projects/#{keyword.project.id}/keywords"
    end

    it 'includes crawl results' do
      expect(json_response.first['crawl_results']).to eq []
    end
  end
end
