// EXEC:%compiler  -g %cmp_opt -module-name module007 -c %n.cj -o %output | compare %f


package pkgs

external let one : Int32 = 1
external let two : Int32 = 2
external let pi : Float32 = 3.1415

// ASSERT:scan  6: ststatic module007/pkgs.
// ASSERT:scan  7: ststatic module007/pkgs.
// ASSERT:scan  8: ststatic.64 module007/pkgs.