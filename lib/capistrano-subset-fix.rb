require 'capistrano'

module Capistrano
  class Configuration
    module Connections
      # Determines the set of servers within the current task's scope and
      # establishes connections to them, and then yields that list of
      # servers.
      def execute_on_servers(options={})
        raise ArgumentError, "expected a block" unless block_given?

        task, servers = filter_servers(options)
        return if servers.empty?
        logger.trace "servers: #{servers.map { |s| s.host }.inspect}"

        max_hosts = (options[:max_hosts] || (task && task.max_hosts) || servers.size).to_i
        is_subset = max_hosts < servers.size

        # establish connections to those servers in groups of max_hosts, as necessary
        servers.each_slice(max_hosts) do |servers_slice|
          begin
            establish_connections_to(servers_slice)
          rescue ConnectionError => error
            raise error unless task && task.continue_on_error?
            error.hosts.each do |h|
              servers_slice.delete(h)
              failed!(h)
            end
          end

          begin
            yield servers_slice
          rescue RemoteError => error
            raise error unless task && task.continue_on_error?
            error.hosts.each { |h| failed!(h) }
          end

          # if dealing with a subset (e.g., :max_hosts is less than the
          # number of servers available) teardown the subset of connections
          # that were just made, so that we can make room for the next subset.
          #teardown_connections_to(servers_slice) if is_subset
        end
      end
    end
  end
end
