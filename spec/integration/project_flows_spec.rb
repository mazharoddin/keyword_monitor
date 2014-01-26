require 'spec_helper'

describe 'Project flows' do
  describe 'Create a new project' do
    before do
      post "/api/projects", project: {name: "Awesome Project"}

      @status        = response.status
      @response_json = JSON.parse(response.body)
    end

    it { expect(@status).to eq(201) }
    it { expect(@response_json).to include 'name' => 'Awesome Project' }
  end
end
