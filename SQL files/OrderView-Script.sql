CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `orderview` AS
    SELECT 
        `t0`.`userID` AS `userID`,
        `t0`.`orderNumber` AS `orderNumber`,
        `t0`.`orderDate` AS `orderDate`,
        `t0`.`orderStatus` AS `orderStatus`,
        `t0`.`shippedDate` AS `shippedDate`,
        `t2`.`productNumber` AS `productNumber`,
        `t2`.`name` AS `name`,
        `t1`.`quantity` AS `quantity`,
        `t2`.`price` AS `price`,
        (`t2`.`price` * `t1`.`quantity`) AS `Total`
    FROM
        ((`orders` `t0`
        JOIN `orderdetails` `t1` ON ((`t1`.`orderNumber` = `t0`.`orderNumber`)))
        JOIN `products` `t2` ON ((`t2`.`productNumber` = `t1`.`productNumber`)))
    WHERE
        (`t0`.`userID` = 3)