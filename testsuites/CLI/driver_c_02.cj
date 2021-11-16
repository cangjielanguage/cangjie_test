// EXEC: %compiler %cmp_opt -compile %f
// EXEC: %ls 2>&1 | compare %f
// ASSERT: scan-not driver_c_02.o
// ASSERT: scan-not driver_c_02.cjo
