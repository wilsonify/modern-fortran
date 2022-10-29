based on 
Developing Statistical Software in Fortran 95
by 
David R. Lemmon
Joseph L. Schafer

which contains the following motivation:

Few statisticians consider themselves to be professional computer programmers,
but many ﬁnd it necessary to write code at one time or another. 
Many excellent books have been written on topics of statistical computing techniques for inverting and decomposing symmetric,
positive-deﬁnite matrices;
methods for generating random variates; 
calculating tail areas from normal, t, and F distributions; 
and so on (e.g., Kennedy and Gentle, 1980; Thisted, 1988). 

The rapid growth of computationally intensive approaches to solving statistical problems 
such as Markov chain Monte Carlo and the jackknife has begun to deﬁne a new ﬁeld of study known as computational statistics (Gentle, 2002). 

Graduate courses oﬀered by statistics and biostatistics departments tend to emphasize these topics, 
but less time is devoted to the nuts and bolts of how to write a good program. 
The excellent Numerical Recipes series by Press, Flannery, Teukolsky, and Vetterling (1992, 1996) contains a wealth of functions and subroutines, 
but these books say little about the infrastructure needed to turn computational procedures into robust, useful programs. 

General textbooks that teach how to program in Fortran, C++, or Java are essential for learning these languages, 
but they target a broad audience and contain few examples of direct interest to statisticians.

After perusing these resources, statisticians who need to begin programming are unsure how to start. 
What they lack is a framework or paradigm for developing statistical applications. 
Most of us, through trial and error gradually settle into a self-styled routine for generating code. 
Eventually we ﬁnish a program that seems to work well enough for the immediate purpose, 
but we are never quite satisﬁed with the ﬁnished product. 
It frequently crashes and we cannot tell why. 
In hindsight, we realize that unfortunate decisions made early in the development process locked in some major limitations, 
and afterward the program is very diﬃcult to change. 

Fortunately, good programming styles can be taught and learned. 
The purpose of this book is to help a statistician, methodologist, or statistically oriented researcher to write a good Fortran program the ﬁrst time. 
We hope to make the experience of developing Fortran applications as quick, painless, and rewarding as possible.