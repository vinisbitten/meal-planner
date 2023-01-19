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

CREATE SEQUENCE measurament_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE measurament
(
    measurament_id bigint NOT NULL UNIQUE DEFAULT nextval('measurament_id_seq'),
    measurament_name text NOT NULL UNIQUE,
    measurament_abbreviation text NOT NULL UNIQUE,
    CONSTRAINT measurament_pkey PRIMARY KEY (measurament_id)
);

CREATE TABLE ingredients
(
    ing_id bigint NOT NULL UNIQUE DEFAULT nextval('ingredients_id_seq'),
    ing_name text NOT NULL UNIQUE,
    ing_fat integer,
    ing_carbs integer,
    ing_protein integer,
    ing_calories integer,
    ing_other_nutrients text [],
    CONSTRAINT ing_pkey PRIMARY KEY (ing_id)
);

CREATE TABLE meals
(
    meal_id bigint NOT NULL UNIQUE DEFAULT nextval('meals_id_seq'),
    meal_name text NOT NULL UNIQUE,
    meal_description text,
    meal_instructions text,
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
    meal_other_nutrients text [],
    meal_prep_time text,
    meal_prep_big_tasks text [],
    CONSTRAINT meal_pkey PRIMARY KEY (meal_id)
);

CREATE TABLE meals_ingredients
(
    meal_id bigint REFERENCES meals(meal_id),
    ing_id bigint REFERENCES ingredients(ing_id),
    measurament_id bigint REFERENCES measurament(measurament_id),
    amount integer,
    CONSTRAINT mealsingredients_pkey PRIMARY KEY (meal_id, ing_id)
);

CREATE TABLE dayly_planner
(
    day_plan_id bigint NOT NULL UNIQUE DEFAULT nextval('dayly_planner_id_seq'),
    
);

CREATE TABLE meals_dayly_planner
(
    meal_id bigint REFERENCES meals(meal_id),
    day_plan_id bigint REFERENCES dayly_planner(day_plan_id),
    CONSTRAINT mealsdaylyplanner_pkey PRIMARY KEY (meal_id, day_plan_id)
);