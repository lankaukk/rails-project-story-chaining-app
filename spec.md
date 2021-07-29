# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] [A User has many contributions. A Story has many contributions.] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] [A contribution belongs to a story] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] [A User has many stories through contributions. A Story has many users through contributions.] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] [A User has many stories through contributions. A Story has many users through contributions.] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] [A User has many stories through contributions. A Story has many users through contributions.] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] [User has a valid and unique email, and their bio cannot be longer than 200 characters. A story has a hook that is no longer than 50 characters. A contribution has a body with length between 6 and 100 characters.] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] [The story model has a most_recent scope method] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] [Can login and signup  with github] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate