And you can use the close statement to close a file once you’re done with it.

In general, it’s good practice to close files as soon as you’re done with them to
prevent potential problems caused by running out of available file handles.

In Fortran, all I/O is sequential by default.
 That is, when you read or write
data to a file, you always start at the beginning of the file and work your way
to the end.
 However, you can change this behavior using the access = ‘direct’
or access = ‘stream’ option in the open statement, depending on the type of
access you want to use.

Note that you can use the same format string in both read and write statements.

This is useful when you need to read data in a specific format, process it, and
write it back out again.
 Additionally, you can use the same format string for
multiple read and write statements to maintain consistency in your code.


The read and write statements are the main means of reading from and writing to files in Fortran.
 

Both read and write statements can specify the unit number, 
which determines the file or stream to read from or write to.
 

If a unit number isn't specified, Fortran defaults to standard input or standard output.


The open statement is used to open a file for reading or writing, 
or to redirect output from standard streams to a file on disk.
 

When opening a file, you can specify various options such as the file access mode (read, write, or append), 
file format (unformatted or formatted), and more.



The close statement is used to close an open file or stream.

 This is important because it flushes any remaining data in memory to disk and releases the system resources associated with the file.



The inquire statement is used to retrieve information about a file or stream.

 You can use the inquire statement to check if a file exists, its size, and whether it's open or not.
 You can also retrieve the status of a file or stream and use it to determine if an I/O operation was successful or not.


In conclusion, 
Fortran provides a comprehensive set of I/O features that you can use to read from and write to files and streams.
 The read, write, open, close, and inquire statements, 
along with format strings and unit numbers, provide you with the tools you need to handle I/O operations in Fortran.
