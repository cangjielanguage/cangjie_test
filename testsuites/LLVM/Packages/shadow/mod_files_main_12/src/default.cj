// DEPENDENCE: ../mod1
// EXEC-PIPE-1: %compiler %cmp_opt %mod_opt ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: regex warning.*function 'main' which doesn't belong to source file under src path will not be treated as entry function
