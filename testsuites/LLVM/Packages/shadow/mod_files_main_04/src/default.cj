// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: regex warning.*function 'main' which doesn't belong to source file under src path will not be treated as entry function
// EXEC: %run_pkg %run_opt %main %run_args

