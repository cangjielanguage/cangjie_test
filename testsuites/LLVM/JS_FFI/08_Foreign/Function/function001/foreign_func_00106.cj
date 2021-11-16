// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

external foreign func foo():Unit 

foreign {
external func bar():Unit 
}
