# R script that uses the Magic8Obj COM Server

# Load rcom library
library(rcom);

# create object instance
objMagic8 <- comCreateObject("magic8_com.Magic8Obj");

# invoke ’msg’ property
msg <- comGetProperty(objMagic8,"msg" );

# release object from memory
rm(objMagic8);

# print message
cat(paste("\n\n", msg, "\n"));