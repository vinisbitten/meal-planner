package entity

import "errors"

// NutritionalInfo represents the nutritional information for a meal
type NutritionalInfo struct {
	Calories int
	Protein  int
	Carbs    int
	Fat      int
}

func (n *NutritionalInfo) Isvalid() error {
	switch {
	case n.Calories <= 0:
		return errors.New("calories must be a positive number")
	case n.Protein < 0:
		return errors.New("protein must be zero or a positive number")
	case n.Carbs < 0:
		return errors.New("carbs must be zero or a positive number")
	case n.Fat < 0:
		return errors.New("fat must be zero or a positive number")
	default:
		return nil
	}
}