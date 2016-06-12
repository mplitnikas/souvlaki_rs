require 'edn'
require_relative 'log'

module SouvlakiRS

  module Config
    CONFIG_FILE = File.join( ENV['HOME'], '.souvlaki_rs') # file in EDN format

    def self.get_host_info(host)
      get_entry(host)
    end

    def self.get_program_info(code = nil)
      progs = get_entry(:programs)

      if progs
        return progs if code == nil
        return progs[code] if progs.key?(code)
      end
      nil
    end

    def self.get_dropbox_folder_info()
      get_entry(:dropbox)
    end


    private
    # will cache config data
    @@data = nil

    def self.get_entry(e)

      if @@data == nil
        if !File.exist? CONFIG_FILE
          SouvlakiRS::logger.error "Config File '#{CONFIG_FILE}' not found"
          return nil
        end

        # read contents
        File.open(CONFIG_FILE) do |file|
          @@data = EDN::read(file)
        end
      end

      return @@data[e] if @@data && @@data.key?(e)

      nil
    end

  end

end
