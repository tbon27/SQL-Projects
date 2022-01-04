USE db_zooTest1
GO
SELECT species_names
FROM tbl_nutrition
WHERE nutrition_cost <= 600;

SELECT * FROM tbl_nutrition;
SELECT * FROM tbl_species;



SELECT
	[Species Name:].species_name,


	SELECT [Species Name:].species_name, a6.nutrition_type
		FROM tbl_species [Species Name:], tbl_nutrition a6
		WHERE a1.species_name = 'Species Name:' AND a6.nutrition_type = 'Nutrition Type:'
	;


	-- Question: I wasnt sure how to use the WHERE statement with this
	--- I wasn't sure if it was needed
	SELECT species_name AS [Species Name:], nutrition_type AS [Nutrition Type:]
	FROM tbl_species 
	INNER JOIN tbl_nutrition 
	ON nutrition_id = species_nutrition 
	WHERE nutrition_id > 2202 AND nutrition_id < 2206;

	SELECT a1.specialist_fname, a1.specialist_lname, a1.specialist_contact, a2.species_care
	FROM tbl_specialist a1
	INNER JOIN tbl_care a2 ON a2.care_id = a1.species_
	WHERE species_name = 'penguin';

	SELECT a1.species_name, a1.species_care, a2.care_specialist, a3.specialist_fname, a3.specialist_lname, a3.specialist_contact
	FROM tbl_species a1
	INNER JOIN tbl_care a2 ON a2.care_id = a1.species_care
	INNER JOIN tbl_specialist a3 on a3.specialist_id =  a1.species_
	WHERE species_name = 'penguin';



	SELECT a3.specialist_fname, a3.specialist_lname, a3.specialist_contact 
	FROM tbl_species a1 
	INNER JOIN tbl_care a2 ON a2.care_id = a1.species_care 
	INNER JOIN tbl_specialist a3 ON a3.specialist_id = a2.care_specialist
	WHERE species_name = 'penguin';