# LetterGenerator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'letter_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install letter_generator

## Usage

Generate letter based on template:

1. Create a directory first

   ```
   mkdir -p directory
   cd directory
   ```

2. Create a data file in directory

   ```yaml
   from:
     name: Max Muster
     street: Musterstraße 1
     city: 11111 Musterhausen
   to:
     name: Mina Muster
     street: Musterstraße 2
     city: 22222 Musterstadt
   subject: Lovely hearing from you
   ```

3. Run generator

    ```bash
    letter_generator generate
    ```

After this a tex file named "letter.tex" exists.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/letter_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
