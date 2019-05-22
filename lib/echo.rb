CommandFailed = Class.new(SystemExit)

def echo(command)
  $stderr.puts "\e[90m   #{command}\e[0m"
end

def echo_run(command, options={})
  if options[:fake]
    echo command
    true
  elsif options[:echo] == :all
    print "\e[90m   "
    puts command
    result = system command
    print "\e[0m"
    result
  else
    echo command unless options[:echo] == false
    system command
  end
end

def echo_run!(command, options={})
  return if echo_run(command, options)
  raise CommandFailed
end

def echo_exec(command, options={})
  echo command
  if options[:fake]
    true
  else
    exec command
  end
end

def announce(message)
  puts "\n\e[94m → #{message}\e[0m"
end

def warn(message)
  puts "\n\e[93m ! #{message}\e[0m"
end

def failure(message)
  puts "\n\e[91m × #{message}\e[0m"
end

def success(message)
  puts "\n\e[32m ✓ #{message}\e[0m"
end

def waiting(message)
  spinner = %w(⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
  puts
  thread = Thread.new do
    while true do
      sleep 0.05
      print "\e[94m #{spinner.rotate![0]} #{message}\r"
    end
  end
  yield
  thread.kill
  puts "\e[94m → #{message}\e[0m"
end

def prompt(message)
  print "\n\e[97m → #{message}\e[0m "
end
