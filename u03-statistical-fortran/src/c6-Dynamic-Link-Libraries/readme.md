# 6 Creating and Using Dynamic-Link Libraries

6.1 Extending the Functionality of Statistical Packages with Fortran DLLs
6.1.1 Compiled Procedures Run Faster
6.1.2 When to Use a DLL
6.2 Understanding Libraries
6.2.1 Source-Code Libraries
6.2.2 Static Libraries
6.2.3 Dynamic-Link Libraries
6.3 How Programs Use DLLs
6.3.1 Locating the DLL
6.3.2 DLL Hell
6.3.3 Dynamic Loading and Linking
6.3.4 Load-Time and Run-Time Linking
6.4 Creating a Fortran DLL
6.4.1 The Basic Steps
6.4.2 Passing Arguments
6.4.3 Calling Conventions
6.4.4 Compiling and Linking the Source Code
6.4.5 Compiler Options
6.5 Example: a Fortran DLL for Fitting an Exponential Mixture 202
6.5.1 Creating a Wrapper
6.5.2 Building the DLL with Intel Visual Fortran and Lahey/Fujitsu Fortran
6.5.3 Building with Salford Fortran
6.5.4 Calling the DLL Procedure from S-PLUS and R
6.5.5 Calling the Function from SAS/IML
6.6 Shared Objects in Unix and Linux
6.6.1 An Example: Extending S-Plus and R via a Fortran Shared Object in Linux
