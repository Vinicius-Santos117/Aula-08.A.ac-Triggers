CREATE TRIGGER dbo.lost_credits
ON dbo.takes
AFTER DELETE AS
IF (ROWCOUNT_BIG() = 0)
RETURN;
BEGIN
    UPDATE dbo.student
    SET dbo.student.tot_cred = dbo.student.tot_cred - course.credits
    FROM dbo.student
    JOIN deleted ON dbo.student.ID = deleted.ID
    JOIN course ON deleted.course_id = course.course_id;
END;

/*

*/

DELETE FROM dbo.takes
WHERE ID = '30299' AND course_id = '604' AND sec_id = '1' AND semester = 'Spring' AND [year] = 2009;
