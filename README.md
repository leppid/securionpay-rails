# SecurionRails ruby gem

If you don't already have SecurionPay account you can create it [here](https://securionpay.com/register).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'securionrails'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install securionrails
```

Unit tests:

```bash
$ bundle exec rake spec:unit
```

Integration tests:

```bash
$ SECRET_KEY='pr_test_id' bundle exec rake spec:integration
```

Mutation tests:

```bash
$ SPEC_OPTS="--pattern spec/unit/**/*_spec.rb" bundle exec mutant --include lib --require securionrails --use rspec securionrails*
```

## Usage

Configuration:

```ruby
SecurionRails::Configuration.secret_key = 'pr_test_id'
```

If you want connect do different backent:

```ruby
SecurionRails::Configuration.service_url = 'https://api.chuck.norris.com'
```

### Create a new Card
Creates a new card object.

```ruby
customer_id = 'cust_id'
card = {
  number: '4242424242424242',
  expMonth: '11',
  expYear: '2022',
  cvc: '123',
  cardholderName: 'John Doe',
}

SecurionRails::Cards.create(customer_id, card)
```

### Retrieve an existing Card

Retrieve an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'

SecurionRails::Cards.retrieve(customer_id, card_id)
```

### Update an existing Card

Update an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'
card = {
  cardholderName: 'Mr Bean'
}
SecurionRails::Cards.update(customer_id, card_id, card)
```

### Delete a Card

Deletes an existing card object.

```ruby
customer_id = 'cust_id'
card_id = 'card_id'
SecurionRails::Cards.delete(customer_id, card_id)
```

### List Cards

List card objects for given customer.

```ruby
customer_id = 'cust_id'
SecurionRails::Cards.list(customer_id)
```

### Create a Blacklist Rule

```ruby
blacklist_rule = {
  ruleType: 'fingerprint',
  fingerprint: '123abc456efg'
}
SecurionRails::Blacklist.create(blacklist_rule)
```

### Retrieve an existing Blacklist Rule

```ruby
blacklist_rule_id = 'blr_number'
SecurionRails::Blacklist.retrieve(blacklist_rule_id)
```

### Delete a Blacklist Rule

```ruby
blacklist_rule_id = 'blr_number'
SecurionRails::Blacklist.delete(blacklist_rule_id)
```

### List Blacklist Rules

```ruby
SecurionRails::Blacklist.list
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/leppid/securionrails
