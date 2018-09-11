# Add seed data here. Seed your database with `rake db:seed`

User.create(:username => "moni", :email => "moni@gmail.com", :password => "monimoni")
User.create(:username => "hello", :email => "hello@email.com", :password => "hi")
User.create(:username => "skittles", :email => "skittles@email.com", :password => "tastetherainbow")

Category.create(:name => "TV")
Category.create(:name => "MOVIE")
Category.create(:name => "RESTAURANT")
Category.create(:name => "ACTIVITY")
Category.create(:name => "CANDY")

Recommendation.create(:title => "Osteria Morini", :description => "Italian (southern)", :user_id => 2, :category_id => 3)
Recommendation.create(:title => "Acqua al 2", :description => "Italian (florentine); get the pasta and steak samplers", :user_id => 1, :category_id => 3)
Recommendation.create(:title => "Life in Pieces", :description => "netflix show, 30 min.; funny & cute", :user_id => 1, :category_id => 1)
Recommendation.create(:title => "Life is Beautiful", :description => "WWII flick, heartwarming and hearbreaking", :user_id => 2, :category_id => 2)
Recommendation.create(:title => "Reese's Pieces", :description => "chocolate and peanut butter, yum", :user_id => 3, :category_id => 5)
