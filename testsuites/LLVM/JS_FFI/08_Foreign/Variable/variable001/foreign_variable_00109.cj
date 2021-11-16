// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

external foreign var a = 1 
external foreign let b = 1
foreign {
external var c = 1 
external let d = 1 
}
