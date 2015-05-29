module Fluent
  class ELBHealthCheckInput < HttpInput
    Plugin.register_input('elb_healthcheck', self)

    config_param :tag_prefix, :string, :default => "elbhealthcheck"
    config_param :add_tag_prefix, :bool, :default => true
    def on_request(path_info, params)
      begin
        if path_info == "/favicon.ico"
          return ["404", {}, ""] 
        end
        path = path_info[1..-1]  # remove /
        if @add_tag_prefix
          tag = ([@tag_prefix] + path.split('/')).join('.')
        else
          tag = path.split('/').join('.')
        end

        router.emit(tag, Engine.now , {:message => "ping"})
      rescue
        return ["500 Internal Server Error", {'Content-type'=>'text/plain'}, "500 Internal Server Error\n#{$!}\n"]
      end
      return ["200 OK", {'Content-type'=>'text/plain'}, ""]              
    end
  end
end
