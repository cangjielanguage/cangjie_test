// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call


import datetime.*

func main(): Int64{

   TimeSpan.FromTicks(10675199.9)

   return 0

}
