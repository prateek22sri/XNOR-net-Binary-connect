# XNOR-Net-Binary-Connect

Two hardware implementation of a feed-forward Convolutional Neural Network
+ XNOR-Net : faster execution due to the replacement of vector-matrix multiplication to “XNOR + Popcount” operation
+ Binary Connect : faster execution due to the presence of accumulator
+ For the current scope of the project, we consider MNIST dataset which consists of 10 classes of images i.e. 0 to 9.
+ Once the training of the neural network is done using any machine, our hardware design focuses on achieving speedup in the classification phase
+ The weights learned by the neural network will be inserted in the module using a BRAM to the feed forward network
+ These weights along with the images to be classified would be used as an input to the feed forward network on an FPGA
+ The scope of our project is only defined for the implementation of the fully connected layer after the convolutions have been done

For more information [click here](https://github.com/prateek22sri/XNOR-net-Binary-connect/blob/master/XNOR-NET.pdf)
 
