module cooling_example2
  use cooling

  private ! Same as before we hide everything
  public :: MyCooling2

  ! Cooling "functor" type definition
  type, extends(CoolingFunction) :: MyCooling2
     integer :: my_cooling_parameter_1, my_cooling_parameter_2
   contains
     procedure :: init_cooling => init_my_cooling_2
     procedure :: compute_cooling => compute_my_cooling_2
  end type MyCooling2

contains
  ! Procedure definition
  subroutine init_my_cooling_2(this, attr_1, attr_2)
    implicit none

    class(MyCooling2) :: this
    integer :: attr_1, attr_2

    ! We use the default constructor of CoolingFunction
    call this%CoolingFunction%init_cooling(attr_1, attr_2)

    ! We can also do precomputations that will be only used with this version of the cooling
    this%my_cooling_parameter_1 = 3
    this%my_cooling_parameter_2 = 6
    
    write(6,*) 'Intantiation of MyCooling2'

  end subroutine init_my_cooling_2

  subroutine compute_my_cooling_2(this, param_out, param_in1, param_in2)
    implicit none

    class(MyCooling2) :: this
    integer :: param_out
    integer :: param_in1
    integer :: param_in2

    write(6,*) 'Calling MyCooling2%compute_cooling'

    ! Do some treatment on the input parameters (multiplies everything)
    param_out = this%my_cooling_parameter_1 * this%my_cooling_parameter_2 * param_in1 * param_in2
  end subroutine compute_my_cooling_2
end module cooling_example2
