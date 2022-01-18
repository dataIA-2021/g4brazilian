--
-- Indexes for tables
--

--
-- Indexes for table `olist_customers_dataset`
--
ALTER TABLE `olist_customers_dataset`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `olist_orders_dataset`
--
ALTER TABLE `olist_orders_dataset`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_1` (`customer_id`);

--
-- Indexes for table `olist_order_items_dataset`
--
ALTER TABLE `olist_order_items_dataset`
  ADD PRIMARY KEY (`order_id`,`order_item_id`),
  ADD KEY `fk_order_items_2` (`product_id`),
  ADD KEY `fk_order_items_3` (`seller_id`);

--
-- Indexes for table `olist_order_payments_dataset`
--
ALTER TABLE `olist_order_payments_dataset`
  ADD PRIMARY KEY (`order_id`,`payment_sequential`);

--
-- Indexes for table `olist_order_reviews_dataset`
--
ALTER TABLE `olist_order_reviews_dataset`
  ADD PRIMARY KEY (`review_id`,`order_id`),
  ADD KEY `olist_order_reviews_1` (`order_id`);

--
-- Indexes for table `olist_products_dataset`
--
ALTER TABLE `olist_products_dataset`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `olist_sellers_dataset`
--
ALTER TABLE `olist_sellers_dataset`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `product_category_name_translation`
--
ALTER TABLE `product_category_name_translation`
  ADD PRIMARY KEY (`product_category_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `olist_orders_dataset`
--
ALTER TABLE `olist_orders_dataset`
  ADD CONSTRAINT `fk_orders_1` FOREIGN KEY (`customer_id`) REFERENCES `olist_customers_dataset` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `olist_order_items_dataset`
--
ALTER TABLE `olist_order_items_dataset`
  ADD CONSTRAINT `fk_order_items_1` FOREIGN KEY (`order_id`) REFERENCES `olist_orders_dataset` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_order_items_2` FOREIGN KEY (`product_id`) REFERENCES `olist_products_dataset` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_order_items_3` FOREIGN KEY (`seller_id`) REFERENCES `olist_sellers_dataset` (`seller_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `olist_order_payments_dataset`
--
ALTER TABLE `olist_order_payments_dataset`
  ADD CONSTRAINT `fk_order_payments_1` FOREIGN KEY (`order_id`) REFERENCES `olist_orders_dataset` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `olist_order_reviews_dataset`
--
ALTER TABLE `olist_order_reviews_dataset`
  ADD CONSTRAINT `olist_order_reviews_1` FOREIGN KEY (`order_id`) REFERENCES `olist_orders_dataset` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
  
CREATE TABLE `olist_geolocation_dataset_unique` AS
 SELECT G.geolocation_zip_code_prefix AS zip_code,
     AVG(G.geolocation_lat) AS geolocation_lat,
     AVG(G.geolocation_lng) AS geolocation_lng,
     MAX(G.geolocation_city) AS geolocation_city,
     MAX(G.geolocation_state) AS geolocation_state
   FROM olist_geolocation_dataset AS G GROUP BY zip_code;
ALTER TABLE olist_geolocation_dataset_unique
    ADD CONSTRAINT geo_pkey PRIMARY KEY (zip_code);
COMMIT;
