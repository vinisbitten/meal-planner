CREATE SEQUENCE meals_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE ingredients_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE dayly_planner_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE measurament_qty_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE measurament_units_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE measurament_units
(
    measurament_unit_id bigint NOT NULL UNIQUE DEFAULT nextval('measurament_units_id_seq'),
    measurament_unit_description text NOT NULL UNIQUE,
    CONSTRAINT measurament_units_pkey PRIMARY KEY (measurament_unit_id)
);

CREATE TABLE measurament_qty
(
    measurament_qty_id bigint NOT NULL UNIQUE DEFAULT nextval('measurament_qty_id_seq'),
    measurament_qty_description text NOT NULL UNIQUE,
    CONSTRAINT measurament_qty_pkey PRIMARY KEY (measurament_qty_id)
);

CREATE TABLE meals
(
    meal_id bigint NOT NULL UNIQUE DEFAULT nextval('ingredients_meals_id_seq'),
    meal_name text NOT NULL UNIQUE,
    -- any tags that can be used to search for the meal
    meal_tags text [],
    -- meal course (breakfast, lunch, dinner, snack, main, side, dessert, etc.)
    meal_course text [],
    -- meal cuisine (italian, mexican, american, etc.)
    meal_cuisine text [],
    meal_fat integer,
    meal_carbs integer,
    meal_protein integer,
    meal_calories integer,
    meal_prep_time text,
    meal_prep_big_tasks text [],
    meal_ingredients text [] REFERENCES ingredients(ingredient_name),
    CONSTRAINT meal_pkey PRIMARY KEY (meal_id)
);

CREATE TABLE ingredients
(
    ing_id bigint NOT NULL UNIQUE DEFAULT nextval('ingredients_id_seq'),
    ing_name text NOT NULL UNIQUE,
    ing_fat integer,
    ing_carbs integer,
    ing_protein integer,
    ing_calories integer,
    CONSTRAINT ing_pkey PRIMARY KEY (ingredient_id)
);

CREATE TABLE meals_ingredients
(
    meal_id bigint REFERENCES meals(meal_id),
    ing_id bigint REFERENCES ingredients(ing_id),
    measurament_qty_id bigint REFERENCES measurament_qty(measurament_qty_id),
    measurament_unit_id bigint REFERENCES measurament_units(measurament_unit_id),
    CONSTRAINT mealsingredients_pkey PRIMARY KEY (meal_id, ing_id)
);

CREATE TABLE dayly_planner
(
    day_plan_id bigint NOT NULL UNIQUE DEFAULT nextval('dayly_planner_id_seq'),
    day_plan_tasks text [] REFERENCES meals(meal_prep_big_tasks),
    day_plan_meals_id text [] REFERENCES meals(meal_name),
    day_plan_ingredients text [] REFERENCES ingredients(ing_name)
);

CREATE TABLE meals_dayly_planner
(
    meal_id bigint REFERENCES meals(meal_id),
    day_plan_id bigint REFERENCES dayly_planner(day_plan_id),
    CONSTRAINT mealsdaylyplanner_pkey PRIMARY KEY (meal_id, day_plan_id)
);

CREATE TABLE weekly_planner
(
    week_tasks text [] REFERENCES meals(meal_prep_big_tasks),
    week_meals text [] REFERENCES meals(meal_name),
    week_ingredients text [] REFERENCES ingredients(ing_name)
);