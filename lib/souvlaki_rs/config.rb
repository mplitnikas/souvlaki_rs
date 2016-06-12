require 'edn'
require_relative 'log'

module SouvlakiRS

  module Config
    PATH = ENV['HOME']
    FILE = File.join( PATH, '.souvlaki_rs') # file in EDN format

    def self.exist?
      File.exist? FILE
    end

    def self.list_program_codes
      pc = SouvlakiRS::Config.get_program_info
      $stderr.puts "Configured code List:"
      pc.each_pair { |code,data| $stderr.puts " #{code}\t-\t'#{data[:pub_title]}'" }
    end

    def self.get_host_info(host)
      return get_entry(host) if exist?
      nil
    end

    def self.get_program_info(code = nil)
      if exist?
        progs = get_entry(:programs)

        if progs
          return progs if code == nil
          return progs[code] if progs.key?(code)
        end
      end
      nil
    end

    def self.get_dropbox_folder_info()
      return get_entry(:dropbox) if exist?
      nil
    end


    private
    # will cache config data
    @@data = nil

    def self.get_entry(e)

      if @@data == nil
        return nil if !exist?

        # read contents
        File.open(FILE) do |file|
          @@data = EDN::read(file)
        end
      end

      return @@data[e] if @@data && @@data.key?(e)

      nil
    end

    def self.exist?
      if !File.exist? FILE
        $stderr.puts "Configuration file not found. See config.example and save it as #{FILE} once set up for your needs."
        exit
      end
      true
    end
  end

end
