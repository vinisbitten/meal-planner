package entity

import "errors"

type Ingredient struct {
	// Required
	Name string
	// Optional
	Quantity string
	Unit     string
	Calories int
	Protein  int
	Carbs    int
	Fat      int
}

func (i *Ingredient) IsValid() error {
	if i.Name == "" {
		return errors.New("name is required")
	}
	return nil
}
