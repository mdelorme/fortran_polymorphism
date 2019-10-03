program test_factory
  use cooling
  use cooling_factory
  implicit none

  class(CoolingFunction), allocatable :: my_cooling
  character(len=512) :: func_name
  integer :: cooling_out

  ! 1- We call the factory instantiation
  write(6,*) 'Which cooling function do you want : '
  read(5,'(a)') func_name

  call instantiate_cooling(my_cooling, func_name)

  ! 2- We initialize the cooling function
  call my_cooling%init_cooling(1, 2)

  ! 3- We use it !
  call my_cooling%compute_cooling(cooling_out, 4, 5)
  
  write(6,*) 'Output of cooling : ', cooling_out

  deallocate(my_cooling)
end program test_factory
