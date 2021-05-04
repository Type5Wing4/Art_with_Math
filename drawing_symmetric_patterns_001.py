import matplotlib.pyplot as plt
import numpy as np
import math

def draw_symmetric_patterns(a=1.0,b=4.0,c=5.0,d=3.0):

    r = 2.0

    ys = np.zeros((90,45,2))
    for phi in range(0,90,1):
        for theta in range(0,45,1):
                ys[phi][theta][0] = r * math.sin(a*phi) * math.sin(b*theta)
                ys[phi][theta][1] = r * math.cos(c*phi) * math.sin(d*theta)

    ys = ys.reshape(-1,2)

    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.scatter(ys.T[0], ys.T[1], s=0.5)
    plt.show()


if __name__ == '__main__':

    draw_symmetric_patterns(a=1.0,b=1.0,c=3.0,d=5.0)
    draw_symmetric_patterns(a=1.0,b=4.0,c=5.0,d=3.0)
    draw_symmetric_patterns(a=2.0,b=4.0,c=5.0,d=3.0)
    draw_symmetric_patterns(a=1.0,b=4.0,c=7.0,d=1.0)
