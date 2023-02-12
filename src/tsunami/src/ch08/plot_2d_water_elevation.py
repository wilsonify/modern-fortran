#!/usr/bin/env python
import gif as gif
import matplotlib.cm as cm
import matplotlib.pyplot as plt
import numpy as np

plt.rcParams.update({'font.size': 16})

dt = 0.02
dims = 101, 101
x = range(-50, 51)
frames = []
for i in range(0, 1000, 1):
    print(f"i={i}")
    input_file = 'tsunami_h_' + '%4.4i' % i + '.dat'
    print('Plotting ' + input_file)
    input_nda = np.fromfile(input_file, dtype='float32')
    print(f"input_nda.shape={input_nda.shape}")
    field = np.reshape(input_nda, dims)
    ticks = np.arange(-0.1, 0.11, 0.01)
    field[field > 0.0999] = 0.0999
    field[field < -0.0999] = -0.0999


    @gif.frame
    def plotter():
        fig = plt.figure(figsize=(8, 7))
        ax = fig.add_subplot(111, aspect='equal')
        cnt = plt.contourf(x, x, field, ticks, cmap=cm.Spectral)
        for c in cnt.collections:
            c.set_edgecolor('face')
        plt.colorbar(shrink=0.8)
        plt.xlabel('Distance [m]')
        plt.ylabel('Distance [m]')
        plt.title('Water height @ time = ' + '%3.1f' % (i * dt) + ' s')
        # plt.savefig(input_file[:-2] + '.png')


    frames.append(plotter())

gif.save(frames, 'tsunami.gif', duration=50)
