import matplotlib.pyplot as plt
import numpy as np
import math

def draw_symmetric_patterns(a=1.0,b=4.0,c=5.0,d=3.0):

    ys = np.zeros((90,45,2))
    for phi in range(0,90,2):
        for theta in range(0,45,2):
                ys[phi][theta][0] = math.sin(a*phi) * math.sin(b*theta)
                ys[phi][theta][1] = math.cos(c*phi) * math.sin(d*theta)

    ys = ys.reshape(-1,2)

    return ys



if __name__ == '__main__':

    fig, axes = plt.subplots(ncols=9,nrows=9,subplot_kw=({"xticks":(),"yticks":()}))
    counter = 0
    for a in range(7,10):
        for b in range(7,10):
            for c in range(7,10):
                for d in range(7,10):
                    ys = draw_symmetric_patterns(a,b,c,d)
                    axes[counter//9,counter%9].scatter(ys.T[0], ys.T[1], s=0.1)
                    counter += 1

    plt.show()
