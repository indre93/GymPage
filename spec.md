# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
> *User has many workouts / Workout has many routines / Exercise has many routines*

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
> *Workout belongs to User / Routine belongs to Workout and Exercise*

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
> *User has many exercies and routines through workouts / Workout has many exercises through routines / Exercise has many workouts through routines*

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
> *Workout has many exercises through routines / Exercise has many workouts through routines*

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
> *Routine has a "caption" attribute*

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
> *User, Workout, Exercise, and Routine models have validations*

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
> *included scope method for Workout, Exercise, and Routine model*

- [x] Include signup (how e.g. Devise)
> *signup included*

- [x] Include login (how e.g. Devise)
> *login included*

- [x] Include logout (how e.g. Devise)
> *logout included*

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
> *included google omniauth*

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
> *included workouts nested resource show page for users / included routines nested resource index page for exercises*

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
> *included routines nested rosurce "new" form for workouts*

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
> *included form display of validation errors*

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [ ] Views use partials if appropriate