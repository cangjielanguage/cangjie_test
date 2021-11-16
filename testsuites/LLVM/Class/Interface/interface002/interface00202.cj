// EXEC: %compiler %cmp_opt -c %f
interface I1{}
interface I2{}

interface I3 <: I1 &I2{}
