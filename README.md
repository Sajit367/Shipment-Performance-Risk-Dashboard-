# Shipment-Performance-Risk-Dashboard
A logistics performance and risk view built from synthetic telemetry data.
Dataset: https://www.kaggle.com/datasets/datasetengineer/logistics-and-supply-chain-dataset

**What the dashboard shows**

Total Shipments: 32.07K

High-Risk Shipments: 17.18K

Average Fuel Rate: 8.01

Average Delivery Delay: 6.58 hours

Weather distribution: 29.76%, 29.38%, 20.42%, 20.40%

Top states by volume/risk: North Carolina, Quebec, Hamilton City, Texas, Ontario

Trend: monthly shipments with a recurring dip around February each year

**Insights**

Total volume is 32.07K with 17.18K flagged high-risk (about 53–54%). Risk is a central story here.

Average fuel rate is 8.01 and average delivery delay is 6.58 hours—the two headline efficiency and service KPIs to watch.

The monthly trend shows a repeat dip in February, suggesting a predictable seasonal slow-down.

North Carolina, Quebec, Hamilton City, Texas, and Ontario account for a large share of both volume and risk.

The weather split is balanced: two categories around ~30% and two around ~20%, which makes weather a meaningful planning variable.

**What this means (actions)**

Start with North Carolina and Quebec as pilot regions. Tighten SLAs, add small schedule buffers, and track how average delay moves afterward.

Add a High-Risk Rate by state view next to counts to separate genuinely risky regions from just high-volume ones.

Use the February dip window for maintenance, staff training, and right-sizing carrier capacity.

Treat weather as a first-class filter. If two categories sit near ~30%, plan alternate lanes and pickup windows when those conditions are forecast.

**KPI glossary**

Total Shipments: count of shipments in the chosen period.

High-Risk Shipments: shipments flagged as high-risk by the model.

High-Risk Rate: High-Risk Shipments ÷ Total Shipments.

Average Fuel Rate: average of the fuel rate measure used in the model.

Average Delivery Delay (hours): average of the delay measure used in the model.

**Data and scope**

Data is synthetic and used for demonstration.

The raw table is telemetry_data. All transformations start from this table.

SQL tables and views were created for personal analysis; the dashboard does not rely on them directly.

**Workflow**

Raw data from Kaggle (link above).

Python script to extract location from latitude/longitude.

SQL tables and views for personal analysis (not used directly in the dashboard).

Modeling in Power BI: relationships and DAX measures.

Dashboard creation in Power BI.

**Notes**

This is a portfolio project focused on structure, modeling choices, and clear communication.
