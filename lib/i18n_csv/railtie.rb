require 'i18n_csv/i18n_csv'

module I18n_CSV
    class Railtie < Rails::Railtie
        initializer "i18n_csv.configure_rails_initialization" do
            I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.csv')]
        end
    end

    class I18nCSV_Engine < ::Rails::Engine
    end
end
