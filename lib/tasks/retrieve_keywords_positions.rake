task retrieve_keywords_positions: :environment do
  Project.find_each do |project|
    `curl http://keyword-monitor.herokuapp.com/api/projects/#{project.id}/keywords/update_positions`
  end
end
