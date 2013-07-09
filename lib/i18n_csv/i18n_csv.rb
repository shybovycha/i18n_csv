require 'csv'

module I18n
    module Backend
        module Base
            protected

            def load_csv(filename)
                begin
                    lines = CSV.read(filename)
                    locale = ::File.basename(filename, '.csv').gsub /^([^.]+\.)/, ''
                    locale = locale.to_sym
                    values = Hash[ lines.map { |l| l if l.size == 2 } ]

                    @translations ||= {}
                    @translations[locale] = values.merge @translations[locale]

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
            def candidate
                translations = I18n.backend.send :translations
                locale = keys.first
                path = ((keys - [ locale ]).map { |k| k.to_s }).join('.')

                translations[locale][path] || keys.last.to_s
            end

            def message
                candidate_lookup
            end

            def html_message
                candidate_lookup
            end
        end
    end
end

I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.csv')]