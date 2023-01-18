CREATE SEQUENCE IF NOT EXISTS meals_id_seq
    AS bigint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE IF NOT EXISTS meals
(
    meal_id bigint NOT NULL UNIQUE DEFAULT nextval('meals_id_seq'),
    meal_name text NOT NULL UNIQUE,
    prep_time text,
    CONSTRAINT meal_pkey PRIMARY KEY (meal_id, meal_name)
);

CREATE TABLE IF NOT EXISTS nutritional_info
(
    nutri_info_id bigint NOT NULL REFERENCES meals(meal_id) UNIQUE,
    calories integer,
    protein integer,
    carbs integer,
    fat integer,
    CONSTRAINT nutri_info_pkey PRIMARY KEY (nutri_info_id)
);