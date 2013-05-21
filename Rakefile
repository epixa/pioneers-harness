load 'rake/helper.rb'

desc 'Get the vagrant box and apps running from scratch'
task :start => [:up, :install, :deploy]
task :default => :start

desc 'Start the vagrant box'
task :up do
  puts 'Starting the vm...'
  vm = VM.new
  vm.cli('up')
end

desc 'Gracefully shut down the vagrant box'
task :down do
  puts 'Gracefully halting the vm...'
  vm = VM.new
  vm.cli('halt')
end

desc 'Destroy the vagrant box'
task :clean do
  puts 'Destroying the vm...'
  vm = VM.new
  vm.cli('destroy', '-f')
end

desc 'Install necessary software on vm'
task :install do
  puts 'Installing software on the vm...'
  vm = VM.new
  vm.check_if_alive

  vm.sudo('DEBIAN_FRONTEND=noninteractive apt-get -q update')
  vm.sudo('DEBIAN_FRONTEND=noninteractive apt-get -qy upgrade')
  vm.sudo('reboot')
end

desc 'Deploy all apps'
task :deploy do
  puts 'Deploying apps...'
end
