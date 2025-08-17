-- View 1: Delay hours by weather condition severity

CREATE VIEW delays_by_weather AS 
SELECT 
	wc.severity_label,
	ROUND(AVG(st.time_deviation)::numeric, 2) AS avg_delay_hours,
	COUNT(*) AS total_shipments
FROM shipment_telemetry st 
JOIN weather_conditions wc ON st.weather_severity = wc.severity_score
GROUP BY wc.severity_label
ORDER BY avg_delay_hours DESC;

-- View 2: Fuel consumption pattern under varying traffic levels

CREATE VIEW fuel_vs_traffic AS 
SELECT 
	ROUND(st.traffic_level::numeric, 1) AS traffic_score,
	ROUND(AVG(st.fuel_rate)::numeric, 2) AS avg_fuel_consumption,
	COUNT(*) AS shipment_count 
FROM shipment_telemetry st
GROUP BY ROUND(st.traffic_level::numeric, 1)
ORDER BY traffic_score;

-- View 3: Spotting risky routes based on disruption, delay, and route risk (for high risk only)

CREATE VIEW high_risk_routes AS
SELECT 
	ROUND(vehicle_lat::numeric, 2) AS approx_lat,
	ROUND(vehicle_long::numeric, 2) AS approx_long,
	ROUND(AVG(disruption_score)::numeric, 2) AS avg_disruption,
	ROUND(AVG(delay_prob)::numeric, 2) AS avg_delay_prob,
	ROUND(AVG(route_risk)::numeric, 2) AS avg_route_risk,
	COUNT(*) AS high_risk_shipments 
FROM shipment_telemetry
WHERE risk_class = 'High Risk'
GROUP BY 
	ROUND(vehicle_lat::numeric, 2),
	ROUND(vehicle_long::numeric, 2)
ORDER BY avg_disruption DESC;

-- View 4: Understanding how supplier reliability affects delivery time

CREATE VIEW supplier_vs_leadtime AS
SELECT
  ROUND(supplier_score::numeric, 2) AS reliability_score,
  ROUND(AVG(lead_time)::numeric, 2) AS avg_lead_time,
  COUNT(*) AS shipment_count
FROM shipment_telemetry
GROUP BY ROUND(supplier_score::numeric, 2)
ORDER BY reliability_score DESC;
