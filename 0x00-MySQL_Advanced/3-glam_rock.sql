-- Old school band
SELECT band_name, 
    (YEAR('2022-01-01') - YEAR(Formed)) - 
        CASE 
            WHEN MONTH('2022-01-01') < MONTH(Formed) THEN 1
            WHEN MONTH('2022-01-01') = MONTH(Formed) AND DAY('2022-01-01') < DAY(Formed) THEN 1
            ELSE 0
        END AS lifespan
    FROM metal_bands
    WHERE FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0
    ORDER BY lifespan DESC;
