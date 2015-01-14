# LetterGenerator

This generator will generate a LaTex Letter Template in the current directory.

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

To invoke the letter generator, you can use `lg` or `letter_generator`.

You need to place an ERB-template at any of this places

1. `<current working directory>/templates/letter.tt`
2. `$HOME/.config/letter_generator/templates/letter.tt`
3. `$HOME/.letter_generator/templates/letter.tt`
4. `/etc/letter_generator/templates/letter.tt`

Generate letter based on template:

1. Create a directory first

   ```
   mkdir -p directory
   cd directory
   ```

2. Create a data file - e.g. data.yaml - in directory

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
