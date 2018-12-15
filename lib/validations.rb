module Validations

  def assert_presence_of!(key, value)
    if !value || (value.is_a?(String) && value.empty?)
      puts_missing_value_message(key)
      exit
    end
  end

  def assert_file_exists!(key, value)
    if !value || (value.is_a?(String) && value.empty?)
      puts_missing_value_message(key)
      exit
    end

    unless File.exist?(value)
      puts_missing_file_message(key, value)
      exit
    end

    unless File.file?(value)
      puts_not_a_file_message(key, value)
      exit
    end
  end

  def assert_directory_exists!(key, value)
    if !value || (value.is_a?(String) && value.empty?)
      puts_missing_value_message(key)
      exit
    end

    unless File.exist?(value)
      puts_missing_file_message(key, value)
      exit
    end

    unless File.directory?(value)
      puts_not_a_directory_message(key, value)
      exit
    end
  end

  def assert_one_of!(key, value, options)
    if !value || (value.is_a?(String) && value.empty?)
      puts_missing_value_message(key)
      puts_options_message(options)
      exit
    end

    unless options.member?(value)
      puts_unrecognized_value_message(key, value)
      puts_options_message(options)
      exit
    end
  end

  def assert_format_of!(key, value, regex, message=nil)
    if !value || (value.is_a?(String) && value.empty?)
      puts_missing_value_message(key)
      exit
    end

    unless value =~ regex
      puts_unmatched_value_message(key, value, message)
      exit
    end
  end




  def puts_missing_value_message(key)
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m<#{key}>\e[0m was left blank"
  end

  def puts_unmatched_value_message(key, value, message)
    message = ": #{message}" if message
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m#{value.inspect}\e[0m is not a legal value for \e[35m<#{key}>\e[0m#{message}"
  end

  def puts_missing_file_message(key, value)
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m#{value}\e[0m is not a \e[35m<#{key}>\e[0m that exists."
  end

  def puts_not_a_file_message(key, value)
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m#{value}\e[0m for \e[35m<#{key}>\e[0m is not a file."
  end

  def puts_not_a_directory_message(key, value)
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m#{value}\e[0m for \e[35m<#{key}>\e[0m is not a directory."
  end

  def puts_unrecognized_value_message(key, value)
    puts "\e[37m#{USAGE}\e[0m",
         "",
         "    \e[35m#{value}\e[0m is not an \e[35m<#{key}>\e[0m that I know."
  end

  def puts_options_message(options)
    puts "    Please select one of the following:"
    options.each do |option|
      puts "       #{option}"
    end
  end

end

include Validations
