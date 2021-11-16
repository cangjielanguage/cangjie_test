// DEPENDENCE: ../003
// EXEC: %compiler %cmp_opt -module 003 -o ./
// EXEC-PIPE: %run %run_opt %main %run_args | compare %f
// ASSERT: scan 1:a.cj 4
// ASSERT: scan 2:main.cj 6
// ASSERT: scan 3:a.cj 10
