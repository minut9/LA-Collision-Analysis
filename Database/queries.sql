-- Creates a merged table to be used for ML - will need to be preprocessed
-- features chosen are NOT final
CREATE TABLE collision_data_ml AS
	SELECT victims.case_id, victims.party_number, victims.victim_number, crashes.accident_year,
	crashes.collision_time, crashes.day_of_week, crashes.weather_1, crashes.primary_coll_factor,
	crashes.type_of_collision, parties.at_fault, parties.party_sex, parties.party_soberiety,
	parties.oaf_1, parties.move_pre_acc, parties.vehicle_year, parties.vehicle_make,
	parties.stwd_vehicle_type, parties.race, crashes.road_surface, crashes.road_cond_1,
	crashes.lighting, crashes.point_x, crashes.point_y, victims.victim_age, victims.severe_injury,
	victims.safety_equip_used, victims.victim_sex, victims.victim_seating_postion, victims.victim_ejected
	FROM victims
	INNER JOIN crashes ON victims.case_id = crashes.case_id
	INNER JOIN parties ON victims.party_id = parties.party_id;
