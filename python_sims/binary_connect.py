import numpy as np
from decimal import *

# Hyperparameters
batch_size = 8

# FC layer weight matrix
weights = np.asarray([0x01,0x33,0x45,0x67,0x89,0xAB,0xCD,0xEF])

# FC input after binarization
nn_in = [1.25, 3.75, 1.25, 3.75, -3.25, -4.25, 0.75, 0.75]
nn_out = list(np.zeros(8))

# Scalars after binarization
alpha = 2.5

# accumulation
weights = [format(x,'#010b')[2:] for x in weights]
for x in range(0,len(weights)):
    for y in range(0,len(weights[x])):
        if weights[x][y] == '1':
            nn_out[x] += nn_in[y]
        else:
            nn_out[x] -= nn_in[y]

print("Matrix vector multiplication after accumulator = ", nn_out)

nn_results = np.zeros(batch_size)
for idx in range(batch_size):
    nn_results[idx] = nn_out[idx] * alpha
print("nn_results after alpha multiplication = ",nn_results)

