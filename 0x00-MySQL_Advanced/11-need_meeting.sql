-- Create a view 'need_meeting' that lists all students that have a
-- Score under 80(strict) and no 'last_meeting' or more than 1 month.
DROP VIEWA IT EXISTS need_meeting;
CREATE VIEW need_MEETING AS
    SELECT name
       FROM students WHERE score < 80 AND
           (
		last_meeting is NULL
		OR last_meeting < SUBDATE((CURRENT_DATA(), INTERVAL 1 MONTH)
           )
;
