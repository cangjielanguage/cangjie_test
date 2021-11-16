// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface I0 <: I2{
interface I0 <: I2{

  interface I1 <: I2.I3{}
}

interface I2 <: I0.I1{
  interface I3 <: I0{}
}

  interface I1 <: I2.I3{}
}

interface I2 <: I0.I1{
  interface I3 <: I0{}
}

// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace