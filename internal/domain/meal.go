package entity

import (
	"errors"
	"time"
)

// Meal represents a meal to be planned
type Meal struct {
	Name            string
	PrepTime        time.Duration
	NutritionalInfo NutritionalInfo
}

func (m *Meal) New() time.Duration {

	return m.prepTime
}

// isvalid validates the meal
func (m *Meal) isvalid() error {
	switch {
	case m.Name == "":
		return errors.New("name is required")
	case m.NutritionalInfo == NutritionalInfo{}:
		return errors.New("nutricional information is required")
	case m.PrepTime == 0:
		return errors.New("prep time is required")
	case m.PrepTime < 0:
		return errors.New("prep time must be greater than 0")
	default:
		return nil
	}
}
