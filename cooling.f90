! Default module for cooling, declares the objects and procedure/functions necessary
module cooling
  private ! We hide everything except the CoolingFunction object
  public :: CoolingFunction
  
  ! Default type for CoolingFunction, declares all the necessary API to be used in RAMSES
  ! Everything that follows will be common to ALL CoolingFunctions in RAMSES
  type CoolingFunction
     ! Attributes
     integer :: attr_1
     integer :: attr_2

   contains
     ! Methods
     procedure :: init_cooling => init_cooling
     procedure :: compute_cooling => compute_cooling
  end type CoolingFunction

contains
  ! We now implement the class' methods
  ! Here, each procedure derived in the type should be declared

  ! Initialization routine
  subroutine init_cooling(this, attr_1, attr_2)
    implicit none
    
    class(CoolingFunction) :: this ! We use "this" as a reference to the object we are manipulating
    integer :: attr_1, attr_2

    ! Store attributes and maybe do some pre-computations here
    this%attr_1 = attr_1
    this%attr_2 = attr_2
  end subroutine init_cooling

  ! Calculation routine
  subroutine compute_cooling(this, param_out, param_in1, param_in2)
    implicit none

    class(CoolingFunction) :: this
    integer :: param_out
    integer :: param_in1
    integer :: param_in2

    ! Do some calculations and return the result
    param_out = -1 
  end subroutine compute_cooling
end module cooling
