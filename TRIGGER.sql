CREATE TRIGGER dbo.lost_credits
ON dbo.takes
AFTER DELETE AS
IF (ROWCOUNT_BIG() = 0)
RETURN;
BEGIN
    UPDATE s
    SET s.tot_cred = s.tot_cred - c.credits
    FROM dbo.student s
    JOIN deleted d ON s.ID = d.ID
    JOIN dbo.course c ON d.course_id = c.course_id;
END;

/*

*/

DELETE FROM dbo.takes
WHERE ID = '30299' AND course_id = '604' AND sec_id = '1' AND semester = 'Spring' AND [year] = 2009;
