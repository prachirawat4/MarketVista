SELECT 
    EngagementID, 
    ContentID, 
    CampaignID, 
    ProductID, 
    UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType, 
    -- PARSENAME expects dots, so we replace '-' with '.' 
    -- Part 2 is the first segment (Views), Part 1 is the second segment (Clicks)
    PARSENAME(REPLACE(ViewsClicksCombined, '-', '.'), 2) AS Views, 
    PARSENAME(REPLACE(ViewsClicksCombined, '-', '.'), 1) AS Clicks, 
    Likes, 
    -- Standard Date Conversion
    FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate 
FROM 
    dbo.engagement_data 
WHERE 
    ContentType != 'Newsletter';
