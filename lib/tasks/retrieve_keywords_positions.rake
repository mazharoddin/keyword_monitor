task retrieve_keywords_positions: :environment do
  base =
    if Rails.env.production?
      'http://keyword-monitor.herokuapp.com'
    else
      'http://localhost:3000'
    end

  `curl #{base}/api/update_keywords_positions`
end
