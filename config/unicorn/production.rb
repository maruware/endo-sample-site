# -*- coding: utf-8 -*-
worker_processes 1
timeout 15

app_path = '/var/www/endo-sample-site/current'

listen "#{app_path}/tmp/sock/unicorn.sock"
pid "#{app_path}/tmp/pids/unicorn.pid"

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

end

# ログの出力
stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'