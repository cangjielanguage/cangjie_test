// EXEC: %compiler %cmp_opt -c %f
// EXEC: %ls 2>&1 | compare %f
// ASSERT: scan-not driver_c_01.o
// ASSERT: scan-not driver_c_01.cjo
