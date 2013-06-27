require 'i18n_csv/i18n_csv'

module I18n_CSV
  class Railtie < Rails::Railtie
    initializer "i18n_csv.configure_rails_initialization" do
      I18n::Backend::Simple.include(I18n::Backend::CSV18n)
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.csv')]
    end
  end
end
