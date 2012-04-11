# Svpply

This is a ruby wrapper for the Svpply API. It's a work in progress.

## Installation

Add this line to your application's Gemfile:

    gem 'svpply'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svpply

## Usage

### Products

To return all products in the "Shop" section:

    $ Svpply.products

To perform a search, the syntax is similar:

    $ Svpply.products("tshirt")
    $ Svpply.products("tshirt", genders: ['male'], prices: ['$1-20'])
    $ Svpply.products(genders: ['male'])

etc...

Single product lookup:

    $ Svpply.product(880581)


### Categories

Return all categories:

    $ Svpply.categories

Products in a given category:

    $ Svpply.categories.first.products

Categories have children categories:

    $ Svpply.categories.first.children
    $ Svpply.categories.first.children.first.products

etc...


## TODO:

1. Tests
2. Refactor
3. Flush out full API

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
