# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database; models inherited and relationships made through ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category); Models: User, Category, Recommendation
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts); User has_many :recommendations and has_many :categories, through: :recommendations
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User); Recommendations belongs_to :user and belongs_to :category
- [x] Include user accounts; Users able to create and login to accounts
- [x] Ensure that users can't modify content created by other users; Users only able to edit and delete recommendations that they have created
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying; Recommendations are able to be created, viewed(read), edited and deleted
- [x] Include user input validations; username must be unique; new users must complete username, email and password for account creation
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new); flash messages used to alert a user when a new user account not created, login failed, new recommendation failed to be created, or edited, etc.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
