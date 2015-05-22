module Fluent
  class ELBHealthCheckInput < HttpInput
    Plugin.register_input('elb_healthcheck', self)
    def on_request(path_info, params)
      begin
        path = path_info[1..-1]  # remove /
        tag = path.split('/').join('.')
        router.emit(tag, Engine.now , {:message => "ping"})
      rescue
        return ["500 Internal Server Error", {'Content-type'=>'text/plain'}, "500 Internal Server Error\n#{$!}\n"]
      end
      return ["200 OK", {'Content-type'=>'text/plain'}, ""]              
    end
  end
end
