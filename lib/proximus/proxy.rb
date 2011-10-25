module Proximus
  class Proxy
    def initialize(config_file = 'config/proximus.yml', env='development')
      @config   = load_config(config_file, env)

      @base_url = @config[:base_url]
      @username = @config[:username]
      @password = @config[:password]
      @auth_url = @config[:auth_url]

      @api = RestClient::Resource.new(@base_url)
    end

    def authenticate
      resp = @api[@auth_url].post(:username => @username, :password => @password)
      @sessionid = resp.cookies["sessionid"] # AB: this needs to be genericized
    end

    def execute(method, path)
      @api[path].send method.downcase.to_sym, :cookies => {:sessionid => @sessionid}
    end

    def load_config(file, env)
      YAML.load_file(file)[env].symbolize_keys
    end

    # AB: For history. And fun. 
    #     Proximus::Proxy started out as proximus_maximus_configuratus
    def proximus_maximus_configuratus; end
  end
end
