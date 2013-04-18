require 'fileutils'
require 'mixlib/config'

module SensuCli
  class Settings

    def is_file?(file)
      !File.readable?(file) ? false : true
    end

    def create(directory,file)
      FileUtils.mkdir(directory) if !File.directory?(directory)
      FileUtils.cp(File.join(File.dirname(__FILE__),"../../settings.example.rb"), file)
      puts "We created the configuration file for you at #{file}.  You can also place this in /etc/sensu/sensu-cli. Edit the settings as needed.".color(:red)
      exit
    end

  end

  class Config
    extend(Mixlib::Config)
  end

end
