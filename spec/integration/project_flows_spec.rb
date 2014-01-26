require 'spec_helper'

describe 'Project flows' do
  describe 'Create a new project' do
    before do
      post "/api/projects", project: {name: "Awesome Project"}
    end

    it { expect(status).to eq(201) }
    it { expect(json_response).to include 'name' => 'Awesome Project' }
  end
end
