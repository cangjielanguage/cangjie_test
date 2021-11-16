// EXEC: %compiler %cmp_opt -c %f
interface I0{}
interface I1 <: I0{}
interface I2 <: I1{}
interface I3 <: I2{}
interface I4 <: I3{}
interface I5 <: I4{}

