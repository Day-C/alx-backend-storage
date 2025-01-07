-- Rank contry origins of brands by num of non-unique fans
SELECT origin, SUM(fans) AS n_fans
    From metal_bands
    GROUP BY origin
    ORDER BY n_fans DESC;
