! Default module for cooling, declares the objects and procedure/functions necessary
module cooling
  private ! We hide everything except the CoolingFunction constuctor
  public :: CoolingFunction
  
  ! Default type for CoolingFunction : Should never be instantiated as is !
  ! Declares all the necessary API to be used in RAMSES
  type CoolingFunction
     integer :: attr_1
     integer :: attr_2

   contains
     procedure :: init_cooling => init_cooling
     procedure :: compute_cooling => compute_cooling
  end type CoolingFunction

contains
  ! We now declare the corresponding procedures
  ! Here, each procedure derived in the type should be declared
  subroutine init_cooling(this, attr_1, attr_2)
    implicit none
    
    class(CoolingFunction) :: this
    integer :: attr_1, attr_2

    ! Store attributes and maybe do some pre-computations here
    this%attr_1 = attr_1
    this%attr_2 = attr_2
  end subroutine init_cooling

  subroutine compute_cooling(this, param_out, param_in1, param_in2)
    implicit none

    class(CoolingFunction) :: this
    integer :: param_out
    integer :: param_in1
    integer :: param_in2

    ! Do some calculations are return the result
    param_out = param_in1 + param_in2 + this%attr_1 + this%attr_2
  end subroutine compute_cooling
end module cooling
