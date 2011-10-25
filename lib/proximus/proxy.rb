module Proximus
  class Proxy
    def initialize(config_file = 'config/proximus.yml')
      @config   = load_config(config_file)

      @base_url = @config[:base_url]
      @username = @config[:username]
      @password = @config[:password]

      @api       = RestClient::Resource.new(@base_url)
      @sessionid = authenticate.cookies["sessionid"]
    end

    def authenticate
      @api["session/"].post(:username => @username, :password => @password)
    end

    def execute(method, path)
      @api[path].send method.downcase.to_sym, :cookies => {:sessionid => @sessionid}
    end

    def load_config(file)
      YAML.load_file(File.join(Rails.root, file))[Rails.env].symbolize_keys
    end

    # AB: For history. And fun. 
    #     Proximus::Proxy started out as proximus_maximus_configuratus
    def proximus_maximus_configuratus; end
  end
end
