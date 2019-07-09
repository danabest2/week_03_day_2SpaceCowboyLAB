DROP TABLE IF EXITS space_cowboy;

CREATE TABLE space_cowboy (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT2,
  danger_level VARCHAR(255),
  last_known_location VARCHAR(255),
  homewworld VARCHAR(255),
  favourite_weapon VARCHAR(255),
  cashed_in INT2,
  collected_by VARCHAR(255)
);
