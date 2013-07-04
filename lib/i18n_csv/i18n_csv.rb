require 'csv'

module I18n
    module Backend
        module CSV18n
            def get_translations
                tmp_translations = translations()

                def yaml_to_key_string(hash, prefix = nil)
                    prefix = prefix.to_s

                    if hash.is_a? Hash then
                        hash.collect do |k, v|
                            k = k.to_s

                            yaml_to_key_string(v, (prefix.blank? ? k : prefix + '.' + k)).flatten(1)
                        end
                    elsif hash.is_a? Array
                        [ prefix, [ hash.reject { |e| e.blank? } ] ]
                    else
                        [ prefix, hash ]
                    end
                end

                reload!

                tmp = tmp_translations.collect do |locale, values|
                    [locale, Hash[*yaml_to_key_string(values).flatten(1)]]
                end

                Hash[[*tmp]]
            end

            protected

            def load_csv(filename)
                begin
                    lines = CSV.read(filename)
                    locale = ::File.basename(filename, '.csv').to_sym
                    { locale => Hash[ lines.map { |l| l if l.size == 2 } ] }
                rescue Exception => e
                    Rails.logger.error "I18n CSV error: #{e.message} :: #{e.backtrace}"
                    nil
                end
            end
        end
    end

    class MissingTranslation
        module Base
            def html_message
                key
            end
        end
    end
end