module SerpChecker
  class Base
    include Capybara::DSL

    PAGE_LIMIT            = 6
    MAX_ATTEMPTS_PER_PAGE = 3
    REQUEST_INTERVAL      = 7

    attr_reader :logger

    def initialize host: host
      @logger = Logger.new(STDOUT)
      logger.info('Initializing Base...')

      Capybara.run_server     = false
      Capybara.current_driver = :poltergeist
      Capybara.app_host       = host

      define_headers
      define_viewport_sizing
    end

    def define_headers
      page.driver.headers = {
        'User-Agent'      => 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.16 Safari/537.36',
        'Accept-Language' => 'pt-BR,pt;q=1'}
    end

    def define_viewport_sizing
      page.driver.resize_window(850, 1800)
    end

    def timer seconds
      Timer.new seconds
    end
  end
end
