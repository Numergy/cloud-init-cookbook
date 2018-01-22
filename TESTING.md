# Testing

#### Install dependencies
`bundle install`

#### Run Checkstyle (foodcritic & cookstyle)
`bundle exec rake`

#### Foodcritic
`bundle exec rake test:foodcritic`

#### Cookstyle
`bundle exec rake test:cookstyle`

#### Kitchen
`bundle exec rake test:kitchen`

Docker driver is used for integration testing with test-kitchen. You will need to have docker installed to run integration testing, or adapt the existing .kitchen.yml for your driver.
