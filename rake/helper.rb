# @see https://gist.github.com/juanje/2365480

require 'vagrant'

class VM
  def initialize(opts=nil)
    opts ||= {ui_class: Vagrant::UI::Colored}
    @env = Vagrant::Environment.new(opts)
    @vm = @env.primary_vm
  end

  def check_if_alive
    raise 'Must run `vagrant up`' if !@vm.created?
    raise 'Must be running!' if @vm.state != :running
  end

  def cli(*command)
    @env.cli(*command)
  end

  def sudo(command, opts=nil)
    opts = { :error_check => false }.merge(opts || {})
    @vm.channel.sudo(command, opts) do |type, data|
      channel = type == :stdout ? :out : :error
      case type
        when :stdout
          color = :green
        when :stderr
          color = :red
        else
          color = :clear
      end

      # Print the SSH output as it comes in, but don't prefix it and don't
      # force a new line so that the output is properly preserved
      @vm.ui.info(data.to_s,
                  :prefix   => false,
                  :new_line => false,
                  :channel  => channel,
                  :color    => color)
    end
  end
end
