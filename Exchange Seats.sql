#SQL Schema
#Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.
#
#The column id is continuous increment.
#
#Mary wants to change seats for the adjacent students.
#
#Can you write a SQL query to output the result for Mary?
#
# 
#
#+---------+---------+
#|    id   | student |
#+---------+---------+
#|    1    | Abbot   |
#|    2    | Doris   |
#|    3    | Emerson |
#|    4    | Green   |
#|    5    | Jeames  |
#+---------+---------+
#For the sample input, the output is:
#
#+---------+---------+
#|    id   | student |
#+---------+---------+
#|    1    | Doris   |
#|    2    | Abbot   |
#|    3    | Green   |
#|    4    | Emerson |
#|    5    | Jeames  |
#+---------+---------+
#Note:
#
#If the number of students is odd, there is no need to change the last one's seat.

# Write your MySQL query statement below
SELECT CASE WHEN id%2=1 AND id!=total_rows THEN id+1
            WHEN id%2=1 AND id=total_rows THEN id
            ELSE id-1
            END id, student
FROM (
    SELECT id, student, count(*) over () as total_rows
    FROM seat
    ) t
ORDER BY id
