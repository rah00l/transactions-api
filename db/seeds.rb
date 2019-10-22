# Few records of transactions, merchants and consumers

## Consumers
c1 = Consumer.create first_name: 'Nand', last_name: 'Kishor'
c2 = Consumer.create first_name: 'Raj', last_name: 'Kumar'
c3 = Consumer.create first_name: 'Anvay', last_name: 'Lal'

## Merchants
m1 = Merchant.create name: 'Yatra', domain: 'https://www.yatra.com/'
m2 = Merchant.create name: 'cinepolisindia', domain: 'http://www.cinepolisindia.com'
m3 = Merchant.create name: 'chaipoint', domain: 'http://www.chaipoint.com'

## Transactions
Transaction.create consumer_id: c1.id, merchant_id: m1.id, sale_amount: (rand(11.2...76.9).round(2)), date: (rand*30).days.ago
Transaction.create consumer_id: c1.id, merchant_id: m2.id, sale_amount: (rand(11.2...76.9).round(2)), date: (rand*30).days.ago

Transaction.create consumer_id: c2.id, merchant_id: m1.id, sale_amount: (rand(11.2...76.9).round(2)), date: (rand*30).days.ago
Transaction.create consumer_id: c2.id, merchant_id: m3.id, sale_amount: (rand(11.2...76.9).round(2)), date: (rand*30).days.ago

Transaction.create consumer_id: c3.id, merchant_id: m3.id, sale_amount: (rand(11.2...76.9).round(2)), date: (rand*30).days.ago
