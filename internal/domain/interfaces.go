package entity

import "time"

// MealRepository defines the methods for storing and retrieving meals
type MealRepository interface {
	GetMeal(name string) (Meal, error)
	GetMealByCalories(calories int) (Meal, error)
	GetMealByPrepTime(prepTime time.Duration) (Meal, error)
	GetMeals() ([]Meal, error)
	SaveMeal(meal Meal) error
}
