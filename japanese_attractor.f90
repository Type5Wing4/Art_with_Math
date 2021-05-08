program attractor_orbit_001

        implicit none
        integer :: steps
        double precision :: x = 1d0, y=1d0, t=0d0
        double precision :: sx, sy
        double precision :: xdot, ydot
        double precision :: kx1, ky1
        double precision :: kx2, ky2
        double precision :: kx3, ky3
        double precision :: kx4, ky4
        double precision,parameter :: a=1d-1, b=12d0
        double precision,parameter :: dt = 1d-4
        double precision,parameter :: total_time = 200.0
        integer,parameter :: nb_max_steps = int(total_time / dt)
        integer,parameter :: output_interval = int(0.02 / dt)

        open(12, file="japanese_attractor.xy", status="replace")

        do steps = 1, nb_max_steps

         call attractor(x,y)

         kx1 = xdot
         ky1 = ydot

         sx = x + kx1 * 0.5d0 * dt
         sy = y + ky1 * 0.5d0 * dt

         call attractor(sx,sy)

         kx2 = xdot
         ky2 = ydot

         sx = x + kx2 * 0.5d0 * dt
         sy = y + ky2 * 0.5d0 * dt
        
         call attractor(sx,sy)

         kx3 = xdot
         ky3 = ydot

         sx = x + kx3 * dt
         sy = y + ky3 * dt

         call attractor(sx,sy)

         kx4 = xdot
         ky4 = ydot

         x = x + (kx1 + 2.0d0 * kx2 + 2.0d0 * kx3 + kx4)/6d0 * dt
         y = y + (ky1 + 2.0d0 * ky2 + 2.0d0 * ky3 + ky4)/6d0 * dt

         if(mod(steps,output_interval) .eq. 0) write(12,'(2f9.4)') x, y

         t = t + dt

        end do

        close(12)

        contains

        subroutine attractor(x,y)

                implicit none
                double precision :: x, y

                xdot = y
                ydot = - a * y - x**3d0 + b * sin(t)
               !ydot = - a * y - x**3d0 + b * sin(t)

        end subroutine

end program
