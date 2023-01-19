package usecase

import (
	"encoding/json"

	entity "github.com/vinisbitten/meal-planner/internal/domain"
)

// MealService defines the methods for meal planning
type MealService struct {
	Repository entity.MealRepository
}

//TotalCalories int
//TotalProtein  float32
//TotalCarbs    float32
//TotalFat      float32

// PlanMeal plans a new meal with nutritional information
func (s *MealService) PlanMeal(name string, prep string, cal int, prot float32, carbs float32, fat float32, dto []byte) error {
	// creates a new meal
	meal := new(entity.Meal)
	// adds dto info to the meal
	if dto != nil {
		err := json.Unmarshal(dto, meal)
		return err
	}
	// sets the meal properties
	meal = &entity.Meal{
		Name:         name,
		PrepTime:     prep,
		MealCalories: cal,
		MealProtein:  prot,
		MealCarbs:    carbs,
		MealFat:      fat,
	}
	// validates the meal
	err := meal.Validate()
	if err != nil {
		return err
	}
	// saves the meal
	return s.Repository.SaveMeal(*meal)
}

// GetMeal gets an existing meal by name
func (s *MealService) GetMeal(name string) (entity.Meal, error) {
	return s.Repository.GetMeal(name)
}

// GetMeals gets all planned meals
func (s *MealService) GetMeals() ([]entity.Meal, error) {
	return s.Repository.GetMeals()
}
