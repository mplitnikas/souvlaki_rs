
module SouvlakiRS
  module Airtime

    AIRTIME_IMPORT_CMD='sudo /usr/bin/airtime-import -c'

    def self.import(file)
      if system( "#{AIRTIME_IMPORT_CMD} \"#{file}\"" )
        FileUtils.rm_f(file)
        return true
      end

      SouvlakiRS::logger.error "Airtime import failed - will not delete #{file}"
      false
    end

  end
end
