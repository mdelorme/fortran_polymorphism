module cooling_example1
  use cooling

  private ! Same as before we hide everything
  public :: MyCooling1

  ! Cooling "functor" type definition
  type, extends(CoolingFunction) :: MyCooling1
     integer :: my_cooling_parameter
   contains
     procedure :: init_cooling => init_my_cooling_1
     procedure :: compute_cooling => compute_my_cooling_1
  end type MyCooling1

contains
  ! Procedure definition
  subroutine init_my_cooling_1(this, attr_1, attr_2)
    implicit none

    class(MyCooling1) :: this
    integer :: attr_1, attr_2

    ! We use the default constructor of CoolingFunction
    call this%CoolingFunction%init_cooling(attr_1, attr_2)

    ! We can also do precomputations that will be only used with this version of the cooling
    this%my_cooling_parameter = 3
    
    write(6,*) 'Intantiation of MyCooling1'

  end subroutine init_my_cooling_1

  subroutine compute_my_cooling_1(this, param_out, param_in1, param_in2)
    implicit none

    class(MyCooling1) :: this
    integer :: param_out
    integer :: param_in1
    integer :: param_in2

    write(6,*) 'Calling MyCooling1%compute_cooling'

    ! Do some treatment on the input parameters (sums everything)
    param_out = param_in1 + param_in2 + this%attr_1 + this%attr_2 + this%my_cooling_parameter
  end subroutine compute_my_cooling_1
end module cooling_example1
