import csv
import numpy as np
from numpy.linalg import inv
import matplotlib.pyplot as plt

data_cnt = 10

xx = np.linspace(1, data_cnt, num=data_cnt, dtype = int)

x1 = [29, 35, 45, 56, 65, 82, 87, 97, 109, 138]
a1_mean = [56, 66, 82, 100, 116, 145, 153, 169, 192, 240]

# SVD 1
a1 = np.zeros((data_cnt, 2))
a1[:, 0] = 1
for i in xx:
    a1[i-1, 1] = x1[i-1]

u1, s1, vh1 = np.linalg.svd(a1, full_matrices=True)
u1 = u1[:, :2]
s1 = np.diag(s1)
v1 = vh1.transpose()

y1 = np.zeros((data_cnt, 1))
for i in xx:
    y1[i-1] = a1_mean[i-1]

A1 = np.dot(np.dot(np.dot(v1, inv(s1)), u1.transpose()), y1)

a1_mean_svd = []
for i in xx:
    a1_mean_svd.append(A1[0][0] + A1[1][0]*x1[i-1])

print(A1[1][0], A1[0][0])

# Plot
plt.plot(x1, a1_mean, label='Raw data', color = 'red', marker='o')
plt.plot(x1, a1_mean_svd, label='SVD', color = 'green', marker='o')

plt.show()
