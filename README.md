## Tech Specs:
	-      Ruby 2.3.3 or greater
	-      Database: sqlite / seed file (with few transactions merchants and consumers.)
	-      Framework: Rails 5.1.2
	-	   Test Framework - rspec
				fixtures	factory_girl_rails
	-		HTTP client - httpie
## Commands Used
	```
	rails new transactions-api --api -T

	rails g model merchant name domain

	rails g model consumer first_name last_name

	rails g model transaction consumer:references merchant:references sale_amount:decimal date:date

	rake db:migrate

	rails generate rspec:install

	rails g controller consumers index create update

	mkdir spec/requests && touch spec/requests/consumers_spec.rb
		touch spec/requests/merchants_spec.rb
		touch spec/requests/transactions_spec.rb

	touch spec/factories/consumer.rb

	mkdir spec/support && touch spec/support/request_spec_helper.rb

	rails g controller merchants index create update

	rails g controller transactions index create update
	```
## API Endpoints
	### Consumers
		consumers GET   /consumers(.:format)     consumers#index
			POST  /consumers(.:format)     consumers#create
			PUT   /consumers/:id(.:format) consumers#update

	### Merchants
		merchants GET   /merchants(.:format)     merchants#index
			POST  /merchants(.:format)     merchants#create
			PUT   /merchants/:id(.:format) merchants#update

	### Transactions - (cunsumer & merchant related)
		consumer_transactions GET   /consumers/:consumer_id/transactions(.:format)     transactions#index
			POST  /consumers/:consumer_id/transactions(.:format)     transactions#create
			PUT   /consumers/:consumer_id/transactions/:id(.:format) transactions#update

		merchant_transactions GET   /merchants/:merchant_id/transactions(.:format)     transactions#index
			POST  /marchants/:merchant_id/transactions(.:format)     transactions#create		
			PUT   /merchants/:merchant_id/transactions/:id(.:format) transactions#update
