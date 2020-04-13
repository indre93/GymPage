**User**
 - has_many :workouts
 - has_many :exercises
 - has_many :exercises, through: :workouts
 - has_many :routines, through: :workouts

**Workout**
 - belongs_to :user
 - has_many :routines
 - has_many :exercises, through: :routines

**Exercise** 
 - belongs_to :user
 - has_many :routines
 - has_many :workouts, through: :routines

**Routine** *join table - workouts and exercises*
 - belongs_to :exercise
 - belongs_to :workout


(User => Workout => Exercises => Routine)