import numpy as np

# Hyperparameters
batch_size = 8

# FC layer weight matrix
weights = np.asarray([0x01,0x33,0x45,0x67,0x89,0xAB,0xCD,0xEF])

# FC input after binarization
nn_in = 0x63
nn_out = 0x0

# Scalars after binarization
alpha = 2.5
beta = 2.0

# XNOR operation
xnor_results = np.zeros(batch_size)
for idx in range(batch_size):
    xnor_results[idx] = (nn_in ^ weights[idx])
print("xnor_results=",xnor_results)

# POPCOUNT operation
pop_results = np.zeros(batch_size)
for idx in range(batch_size):
    #print(str(bin(int(xnor_results[idx]))))
    num_ones = 8 - int(str(bin(int(xnor_results[idx]))).count("1"))
    pop_results[idx] = 2*num_ones-8
print("pop_results = ",pop_results) 

# Scalar multiplication (alpha) 
nn_results = np.zeros(batch_size)
for idx in range(batch_size):
    nn_results[idx] = pop_results[idx] * alpha 
print("nn_results after alpha multiplication= ",nn_results)

# Scalar multiplication (beta) 
for idx in range(batch_size):
    nn_results[idx] = nn_results[idx] * beta 
print("nn_results after beta multiplication= ",nn_results)  
