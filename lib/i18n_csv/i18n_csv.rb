require 'csv'

module I18n
    module Backend
        module Base
            protected

            def load_csv(filename)
                begin
                    lines = CSV.read(filename)
                    locale = ::File.basename(filename, '.csv').to_sym
                    values = Hash[ lines.map { |l| l if l.size == 2 } ]

                    @translations ||= {}
                    @translations[locale].merge! values

                    { locale => values }
                rescue Exception => e
                    Rails.logger.error "I18n CSV error: #{e.message} :: #{e.backtrace}"
                    nil
                end
            end
        end
    end

    class MissingTranslation
        module Base
            def message
                keys.last.to_s
            end

            def html_message
                keys.last.to_s
            end
        end
    end
end