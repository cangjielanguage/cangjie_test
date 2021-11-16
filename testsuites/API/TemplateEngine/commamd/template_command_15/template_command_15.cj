//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.t pl | compare %f
//ASSERT: scan IllegalArgumentException The command must contain template names and must be separated by spaces!
