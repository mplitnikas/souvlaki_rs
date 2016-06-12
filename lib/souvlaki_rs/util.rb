require 'fileutils'
require 'filemagic'
require 'uri'

module SouvlakiRS

  module Util
    #
    # joins AIRTIME_ROOT with a subfolder for copying files to
    def self.get_show_path(name)
      File.join(AIRTIME_ROOT, name)
    end

    #
    # tmp file
    def self.get_tmp_path(name = nil)
      return TMP_DIR_PATH if name == nil
      File.join(TMP_DIR_PATH, name)
    end

    #
    # ensure dest directory exists
    def self.check_destination(path, opts = {})

      if !Dir.exist?(path)
        begin
          FileUtils.mkdir_p(path, opts)
        rescue Errno::ENOENT
          SouvlakiRS::logger.error "Error making directory #{path}"
          return false
        end
      end

      true
    end

    #
    # check that the path looks like an mp3 file
    @@fm = FileMagic.new

    def self.get_type_desc(file)
      if File.exist?(file) && File.size(file) > 10
        # checks if the type description contains 'MP3' or 'MPEG'
        return @@fm.file(file)
        re
      end
      nil
    end

    #
    # check if a file exists and delete it
    def self.del_file(file)
      FileUtils.rm(file) if File.exist? file
    end

    #
    # check for valid URI
    def self.valid_uri?(uri)
      uri =~ /\A#{URI::regexp}\z/
    end

  end

end
