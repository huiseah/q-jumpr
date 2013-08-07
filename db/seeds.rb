User.destroy_all
Offer.destroy_all
Bid.destroy_all

u1 = User.create(:email => 'bob@gmail.com', :balance => 75_000, :password => 'a', :password_confirmation => 'a')
u2 = User.create(:email => 'sam@gmail.com', :balance => 80_300, :password => 'a', :password_confirmation => 'a')
u2 = User.create(:email => 'vox@gmail.com', :balance => 100_900, :password => 'a', :password_confirmation => 'a')

