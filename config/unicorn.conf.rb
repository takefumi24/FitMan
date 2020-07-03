$worker  = 2
$timeout = 30
app_path =  "/var/www/FitMan"
$app_dir = "#{app_path}/current"
$listen  = File.expand_path 'shared/tmp/sockets/.unicorn.sock', app_path
$pid     = File.expand_path 'shared/tmp/pids/unicorn.pid', app_path
$std_log = File.expand_path 'shared/log/unicorn.log', app_path

worker_processes  $worker
working_directory $app_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
