User.destroy_all
Stock.destroy_all

u1 = User.create(:email => 'bob@gmail.com', :balance => 100_000, :password => 'a', :password_confirmation => 'a')
u2 = User.create(:email => 'sue@gmail.com', :balance => 115_300, :password => 'a', :password_confirmation => 'a')

o1 = Offer.create(:name => 'mamak restaurant haymarket', :address => '15 Goulburn Street Haymarket NSW' :price => 500.00)
o2 = Offer.create(:symbol => 'goog', :shares => 25, :purchase_price => 700.00)
o3 = Offer.create(:symbol => 'amzn', :shares => 15)
o4 = Offer.create(:symbol => 'msft', :shares => 75)
o5 = Offer.create(:symbol => 'ge', :shares => 35)

u1.offers = [o1, o2, o3, o4]
u2.stocks = [o5]