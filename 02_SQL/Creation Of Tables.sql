-- Creation of database 

CREATE DATABASE supply_chain_bi;

-- Creation of main table 'telemetry_data' and assigning column types

CREATE TABLE telemetry_data (
  timestamp TIMESTAMP,
  vehicle_gps_latitude DOUBLE PRECISION,
  vehicle_gps_longitude DOUBLE PRECISION,
  fuel_consumption_rate FLOAT,
  eta_variation_hours FLOAT,
  traffic_congestion_level FLOAT,
  warehouse_inventory_level FLOAT,
  loading_unloading_time FLOAT,
  handling_equipment_availability FLOAT,
  order_fulfillment_status FLOAT,
  weather_condition_severity FLOAT,
  port_congestion_level FLOAT,
  shipping_costs FLOAT,
  supplier_reliability_score FLOAT,
  lead_time_days FLOAT,
  historical_demand FLOAT,
  iot_temperature FLOAT,
  cargo_condition_status FLOAT,
  route_risk_level FLOAT,
  customs_clearance_time FLOAT,
  driver_behavior_score FLOAT,
  fatigue_monitoring_score FLOAT,
  disruption_likelihood_score FLOAT,
  delay_probability FLOAT,
  risk_classification TEXT,
  delivery_time_deviation FLOAT
);


-- Creation of 'shipment_telemetry' Table for ease of use and clarity. 

CREATE TABLE shipment_telemetry AS
SELECT
  timestamp,
  vehicle_gps_latitude AS vehicle_lat,
  vehicle_gps_longitude AS vehicle_long,
  fuel_consumption_rate AS fuel_rate,
  eta_variation_hours AS time_deviation,
  traffic_congestion_level AS traffic_level,
  warehouse_inventory_level,
  loading_unloading_time,
  handling_equipment_availability,
  order_fulfillment_status,
  weather_condition_severity AS weather_severity,
  port_congestion_level,
  shipping_costs,
  supplier_reliability_score AS supplier_score,
  lead_time_days,
  historical_demand,
  iot_temperature,
  cargo_condition_status,
  route_risk_level AS route_risk,
  customs_clearance_time,
  driver_behavior_score,
  fatigue_monitoring_score,
  disruption_likelihood_score AS disruption_score,
  delay_probability AS delay_prob,
  risk_classification AS risk_class,
  delivery_time_deviation
FROM telemetry_data;

-- Creation date dimension table. 

CREATE TABLE shipment_date (
  date_key DATE PRIMARY KEY,
  day INT,
  month INT,
  year INT,
  week INT,
  quarter INT
);

-- Populating date dimension table 

INSERT INTO shipment_date (date_key, day, month, year, week, quarter)
SELECT DISTINCT 
  DATE(timestamp),
  EXTRACT(DAY FROM timestamp),
  EXTRACT(MONTH FROM timestamp),
  EXTRACT(YEAR FROM timestamp),
  EXTRACT(WEEK FROM timestamp),
  EXTRACT(QUARTER FROM timestamp)
FROM shipment_telemetry;


