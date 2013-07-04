# I18nCsv

One extends standard I18n so that you could store your translations in a Comma-Separated Value files (*CSV*) in a **key-value** manner, where the **key** is a word or a phrase or even a poem if you wish. No limits here (except be aware to escape symbols so the CSV format is kept). And the **value** is the same text as the key but translated to a language, specified by a file name you are using. For example, you could write one line to a `sp.csv` file: `"hello!","hola!"` and use `t 'hello!'` with a *spanish locale* to get the `"hola!"` text.

## A brief of history

See, I used to be a Magento developer for some time. And I really liked their localization approach. In comparison with the Rails, I18n technique with all those horrible YAML keys, Magento internationalization style looked clearly and... well, more usable.

If Magento did not find the translated key' value - it just put the key itself. And if you try to keep all your keys in English, you did not face huge trouble when you did not set the translation for some text. But with the default Rails configuration, you get the HTML saying *I could not find the translation for moo.foo.bar string!*. And that's horrible, I think.

So from my point of view, this approach (*CSV one*) is more flexible and user-friendly. So even customer could customize your locales.

## Installation

Add this line to your application's Gemfile:

    gem 'i18n_csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_csv

## Usage

Let's say you want Ukrainian localization for your application.

First you create file `config/locales/uk.csv` with the following content:

    "hello","привіт"
    "world","світ"
    "hello, world!","хеллоу ворлд =3"

Then you add the `gem 'i18n_csv'` line to your `Gemfile` and run `bundle install`.

Now you are allowed to use the CSV translations in your application!

Here are some examples:

    irb(main):002:0> I18n.locale = :uk
    => :uk
    irb(main):003:0> I18n.t 'hello'
    => "привіт"
    irb(main):004:0> I18n.t 'hello, world!'
    => "хеллоу ворлд =3"

## Frontend translations

Version `0.1.2` includes javascript translation support.

To use it, just add this line to your `app/assets/javascripts/application.js` file:

    //= require i18n_csv/frontend_translation

And you are ready to use the `window.t(key, [locale]);` function on your frontend!

For example of above locale files, imagine you have this line in one of your javascript files:

    alert(t('hello'));

You shall see then `привіт` in your alert window!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
