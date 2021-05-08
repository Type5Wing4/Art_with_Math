program attractor_orbit_001

        implicit none
        integer :: steps
        double precision :: x = 1d0, y=1d0, z=1d0
        double precision :: sx, sy, sz
        double precision :: xdot, ydot, zdot
        double precision :: kx1, ky1, kz1
        double precision :: kx2, ky2, kz2
        double precision :: kx3, ky3, kz3
        double precision :: kx4, ky4, kz4
        double precision,parameter :: a=0.6d0
        double precision,parameter :: dt = 1d-4
        double precision,parameter :: total_time = 200.0
        integer,parameter :: nb_max_steps = int(total_time / dt)
        integer,parameter :: output_interval = int(0.03 / dt)

        open(12, file="langford_attractor.xyz", status="replace")

        do steps = 1, nb_max_steps

         call attractor(x,y,z)

         kx1 = xdot
         ky1 = ydot
         kz1 = zdot

         sx = x + kx1 * 0.5d0 * dt
         sy = y + ky1 * 0.5d0 * dt
         sz = z + kz1 * 0.5d0 * dt

         call attractor(sx,sy,sz)

         kx2 = xdot
         ky2 = ydot
         kz2 = zdot

         sx = x + kx2 * 0.5d0 * dt
         sy = y + ky2 * 0.5d0 * dt
         sz = z + kz2 * 0.5d0 * dt
        
         call attractor(sx,sy,sz)

         kx3 = xdot
         ky3 = ydot
         kz3 = zdot

         sx = x + kx3 * dt
         sy = y + ky3 * dt
         sz = z + kz3 * dt

         call attractor(sx,sy,sz)

         kx4 = xdot
         ky4 = ydot
         kz4 = zdot

         x = x + (kx1 + 2.0d0 * kx2 + 2.0d0 * kx3 + kx4)/6d0 * dt
         y = y + (ky1 + 2.0d0 * ky2 + 2.0d0 * ky3 + ky4)/6d0 * dt
         z = z + (kz1 + 2.0d0 * kz2 + 2.0d0 * kz3 + kz4)/6d0 * dt

         if(mod(steps,output_interval) .eq. 0) write(12,'(3f9.4)') x, y, z

        end do

        close(12)

        contains

        subroutine attractor(x,y,z)

                implicit none
                double precision :: x, y, z

                xdot = (z-0.7d0)*x-3.5d0*y
                ydot = 3.5d0*x+(z-0.7d0)*y
                zdot = a + z - 1d0/3d0 * z**3d0 - (x**2d0 + y**2d0) * (1d0+0.25d0*z)

        end subroutine

end program
