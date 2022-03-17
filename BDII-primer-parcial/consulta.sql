SELECT Matriculates.academicPeriodGroupId,
       CONCAT('(',AcademicPeriodGroups.journeyId ,')', ' ', journey.name) AS JORNADA,
       CONCAT('(',degree.levelId ,')', ' ', l.name) AS NIVEL,
       CONCAT('(',AcademicPeriodGroups.degreeId ,')', ' ', degree.name) AS GRADO,
       CONCAT('(',AcademicPeriodGroups.groupId ,')', ' ', `group`.name) AS GRUPO,
       COALESCE(AcademicPeriodGroups.quota, 'SIN ASIGNAR') AS CUPO_DISPONIBLE,
       COUNT(Matriculates.id) AS CANTIDAD_ESTUDIANTES,
       degree.createdAt AS 'degree.createdAt' , degree.updatedAt AS 'degree.updatedAt' , degree.id AS 'degree.id' , degree.levelId AS 'degree.levelId' , degree.name AS 'degree.name' , degree.abbreviation AS 'degree.abbreviation' ,
       l.createdAt AS 'degree.level.createdAt' , l.updatedAt AS 'degree.level.updatedAt' , l.id AS 'degree.level.id' , l.name AS 'degree.level.name' , l.abbreviation AS 'degree.level.abbreviation' ,
       journey.createdAt AS 'journey.createdAt' , journey.updatedAt AS 'journey.updatedAt' , journey.id AS 'journey.id' , journey.name AS 'journey.name' , journey.abbreviation AS 'journey.abbreviation' ,
       group.createdAt AS 'group.createdAt' , group.updatedAt AS 'group.updatedAt' , group.id AS 'group.id' , group.name AS 'group.name' , group.abbreviation AS 'group.abbreviation'
FROM AcademicPeriodGroups
         LEFT JOIN Matriculates
                    ON Matriculates.academicPeriodGroupId = AcademicPeriodGroups.id
         INNER JOIN Journeys AS journey ON AcademicPeriodGroups.journeyId = journey.id
         INNER JOIN `Degrees` AS degree ON AcademicPeriodGroups.degreeId = degree.id
         INNER JOIN Levels AS l ON degree.levelId = l.id
         INNER JOIN `Groups` AS `group` ON `group`.id = AcademicPeriodGroups.groupId
GROUP BY AcademicPeriodGroups.id
LIMIT 10
