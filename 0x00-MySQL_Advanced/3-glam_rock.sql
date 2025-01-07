-- List all bands with GLAM rock as main style, ranked by their longevity
SELECT brand_name, (IFNULL(split, '2020') - formed) As lifespan
    FROM metal_bands
    WHERE FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0
    ORDER BY lifespan DESC;
