program dynamic_optimization
  implicit none
  integer, parameter :: n = 100
  real(8), parameter :: beta = 0.9, r = 0.1, a0 = 100.0, pi = 3.141592653589793
  real(8) :: a(n), V(n), c(n)
  real(8) :: a_grid(n), utemp, unew
  integer :: i, j, v

  ! Discretize the state space on the interval [0,100]
  call grid_Cons_Cheb(a_grid, 0.0d0, 100.0d0, n)

  ! Initialize the value function
  V = 0.0d0

  ! Value function iteration
  do v = n, 2, -1
    do i = 1, v-1
      utemp = log_custom(a_grid(v) - a_grid(i)) + beta * V(i)
      do j = i-1, 1, -1
        unew = log_custom(a_grid(v) - a_grid(j)) + beta * V(j)
        if (unew > utemp) then
          utemp = unew
        endif
      end do
      V(i) = utemp
    end do
  end do

  ! Calculate optimal consumption
  do i = 1, n
    c(i) = a_grid(i) - exp(log_custom(a_grid(i)) / (1 + beta))
  end do

  ! Print the results
  print *, "Capital grid a:"
  print *, a_grid
  print *, "Value function V(a):"
  print *, V
  print *, "Optimal consumption c(a):"
  print *, c

contains

  subroutine grid_Cons_Cheb(grid, a_min, a_max, n)
    real(8), intent(out) :: grid(n)
    real(8), intent(in) :: a_min, a_max
    integer, intent(in) :: n
    integer :: i
    real(8) :: theta

    do i = 1, n
      theta = (2.0d0 * i - 1.0d0) * pi / (2.0d0 * n)
      grid(i) = (a_max - a_min) / 2.0d0 * cos(theta) + (a_max + a_min) / 2.0d0
    end do
  end subroutine grid_Cons_Cheb

  real(8) function log_custom(x)
    real(8), intent(in) :: x
    log_custom = log(x)
  end function log_custom

end program dynamic_optimization

