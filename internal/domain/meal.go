package entity

import (
	"errors"
	"time"
)

// Meal represents a meal to be planned
type Meal struct {
	name            string
	prepTime        time.Duration
	nutritionalInfo NutritionalInfo
}

func (m *Meal) New() time.Duration {

	return m.prepTime
}

func (m *Meal) isvalid() (bool, error) {
	switch {
	case m.name == "":
		return false, errors.New("name is required")
	case m.nutritionalInfo == (NutritionalInfo{nil, nil, nil, nil}):
		return false, errors.New("nutricional information is required")
	case m.prepTime == 0:
		return false, errors.New("prep time is required")
	case m.prepTime < 0:
		return false, errors.New("prep time must be greater than 0")
	default:
		return true, nil
	}
}
