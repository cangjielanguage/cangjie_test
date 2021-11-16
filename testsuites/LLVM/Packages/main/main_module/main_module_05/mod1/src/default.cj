// DEPENDENCE: ../../mod1 
// EXEC: %compiler %cmp_opt %mod_opt  ./mod1/ -o ./ 2>&1 | compare %f
// ASSERT: regex error.*entry function 'main' is missing

import p1.*



