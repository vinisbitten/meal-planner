package entity

import (
	"errors"
	"time"
)

// Meal represents a meal to be planned
type Meal struct {
	// Required
	Name          string
	PrepTime      string
	TotalCalories int
	TotalProtein  float32
	TotalCarbs    float32
	TotalFat      float32
	// Optional
	Description    string
	Instructions   string
	Tags           []string
	Course         []string
	Cuisine        []string
	Ingredients    []Ingredient
	PrepBigTasks   []string
	OtherMutrients []string
}

// Validate validates the meal
func (m *Meal) Validate() error {
	switch {
	case m.Name == "":
		// returns error if name is empty
		return errors.New("name is required")
	case m.PrepTime == "":
		// returns error if prep time is empty
		return errors.New("prep time is required")
	case m.TotalCalories <= 0:
		// returns error if total calories is negative
		return errors.New("total calories must be a positive number")
	case m.TotalProtein < 0:
		// returns error if total protein is negative
		return errors.New("total protein must be zero or a positive number")
	case m.TotalCarbs < 0:
		// returns error if total carbs is negative
		return errors.New("total carbs must be zero or a positive number")
	case m.TotalFat < 0:
		// returns error if total fat is negative
		return errors.New("total fat must be zero or a positive number")
	default:
		/*

		PRECISA CONFIRMAR COM O RICARDO ESSA LOGICA VALIDANDO OS INGREDIENTES

		*/
		for _, i := range m.Ingredients {
			// validates each ingredient
			if err := i.IsValid(); err != nil {
				// returns error if ingredient is invalid
				return err
			}
		}
		// parses prep time
		if td, err := time.ParseDuration(m.PrepTime); err != nil {
			if td < 0 {
				// returns error if prep time is negative
				return errors.New("prep time must be zero or a positive duration")
			} else {
				// returns error if prep time is not a valid duration
				return err
			}
		}
		// returns nil if no errors
		return nil
	}
}
