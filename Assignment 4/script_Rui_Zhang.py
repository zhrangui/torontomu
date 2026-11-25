"""
Assignment 4: Clustering 
"""
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score

# ==========================================
# 1. Load the Dataset
# ==========================================
# Uses the local CSV file if present; otherwise downloads directly from UCI
local_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Wholesale customers data.csv")
uci_url = "https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale%20customers%20data.csv"

if os.path.exists(local_file):
    df = pd.read_csv(local_file)
else:
    df = pd.read_csv(uci_url)
    df.to_csv(local_file, index=False)

print(f"Dataset shape: {df.shape}")
print("\nMissing values per column:")
print(df.isnull().sum())

# ==========================================
# 2. Data Pre-processing
# ==========================================
# Drop categorical columns so clustering is based strictly on spending behavior
spending_cols = ['Fresh', 'Milk', 'Grocery', 'Frozen', 'Detergents_Paper', 'Delicassen']
data_clustering = df[spending_cols]

# Apply natural log transformation ln(x + 1) to reduce right-skewness
data_log = np.log(data_clustering + 1)

# Standardize features to mean=0 and std=1 for Euclidean distance calculations
scaler = StandardScaler()
data_scaled = scaler.fit_transform(data_log)

# ==========================================
# 3. Select Optimal k (Elbow & Silhouette)
# ==========================================
inertia = []
silhouette_scores = []
k_range = range(2, 11)

print("\nEvaluation Metrics for k = 2 to 10:")
print(f"{'k':<5} {'Inertia':<15} {'Silhouette Score':<18}")
print("-" * 40)

for k in k_range:
    kmeans = KMeans(n_clusters=k, random_state=42, n_init=10)
    labels = kmeans.fit_predict(data_scaled)
    inert = kmeans.inertia_
    sil = silhouette_score(data_scaled, labels)

    inertia.append(inert)
    silhouette_scores.append(sil)
    print(f"{k:<5} {inert:<15.2f} {sil:<18.4f}")

# Plot Elbow Method and Silhouette Score on a dual-axis Matplotlib figure
fig, ax1 = plt.subplots(figsize=(8, 5))

color1 = 'tab:blue'
ax1.set_xlabel('Number of Clusters (k)')
ax1.set_ylabel('Inertia (Within-Cluster Sum of Squares)', color=color1)
line1 = ax1.plot(k_range, inertia, marker='o', color=color1, label='Inertia (Elbow)')
ax1.tick_params(axis='y', labelcolor=color1)
ax1.set_xticks(list(k_range))
ax1.grid(True, linestyle='--', alpha=0.5)

ax2 = ax1.twinx()
color2 = 'tab:green'
ax2.set_ylabel('Silhouette Score', color=color2)
line2 = ax2.plot(k_range, silhouette_scores, marker='s', color=color2, label='Silhouette Score')
ax2.tick_params(axis='y', labelcolor=color2)

# Combine legends from both axes
lines = line1 + line2
labels_legend = [l.get_label() for l in lines]
ax1.legend(lines, labels_legend, loc='upper right')

plt.title('Elbow Method and Silhouette Score for Optimal k')
fig.tight_layout()
plt.savefig('elbow_silhouette.png', dpi=300)
plt.show()

# ==========================================
# 4. Final K-Means Clustering (k = 3)
# ==========================================
optimal_k = 3
kmeans_final = KMeans(n_clusters=optimal_k, random_state=42, n_init=10)
cluster_labels = kmeans_final.fit_predict(data_scaled)
df['Cluster'] = cluster_labels

final_silhouette = silhouette_score(data_scaled, cluster_labels)
print(f"\nFinal Model (k={optimal_k}) Silhouette Score: {final_silhouette:.4f}")

# Print cluster counts and average spending in original monetary units
print("\nNumber of Clients per Cluster:")
print(df['Cluster'].value_counts().sort_index())

cluster_means = df.groupby('Cluster')[spending_cols].mean().round(2)
print("\nCluster Profiling (Average Annual Spending):")
print(cluster_means.to_string())

# ==========================================
# 5. Visualization (Fresh vs. Grocery)
# ==========================================
plt.figure(figsize=(8, 6))
scatter = plt.scatter(
    data_log['Fresh'],
    data_log['Grocery'],
    c=cluster_labels,
    cmap='viridis',
    s=60,
    alpha=0.8,
    edgecolors='k',
    linewidths=0.4
)

plt.title('Wholesale Customer Clusters: Log(Fresh) vs. Log(Grocery)')
plt.xlabel('Log(Fresh Spending + 1)')
plt.ylabel('Log(Grocery Spending + 1)')
plt.grid(True, linestyle='--', alpha=0.5)
plt.legend(*scatter.legend_elements(), title='Cluster')
plt.tight_layout()
plt.savefig('clusters_fresh_vs_grocery.png', dpi=300)
plt.show()



