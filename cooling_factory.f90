module cooling_factory
  ! Here, add all the modules corresponding to cooling
  use cooling
  use cooling_example1
  use cooling_example2
  implicit none

contains
  subroutine instantiate_cooling(out, func_name)
    implicit none
    class(CoolingFunction), allocatable :: out
    character(len=*) func_name

    write(6,*) 'Instancing Cooling function ', trim(func_name)

    ! Here we check the name of the function and allocate the
    ! class accordingly
    select case (func_name)
    case ('Cooling1')
       allocate(MyCooling1::out)
    case ('Cooling2')
       allocate(MyCooling2::out)
    case default
       write(6,*) 'ERROR : Unknown Cooling function !'
       stop
    end select
  end subroutine instantiate_cooling
end module cooling_factory
