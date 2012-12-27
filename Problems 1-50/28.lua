--[[
Problem No. 28
 What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral? 
 
NOTE:-
 This problem taught me that there is nothing 'Random' in Mathematics, EVERYTHING is under a beautiful pattern.

 I solved this by hand, here is the solution.....
 
 Let S1, S2, S3, S4 be the Sum of Upper Left, Upper Right, Bottom Left and Bottom Right Diagonals respectively.
 
 S1 = 1 + 7 + 21 + 43.....
 S2 = 1 + 9 + 25 + 49.....
 S3 = 1 + 5 + 17 + 37.....
 S4 = 1 + 3 + 13 + 31.....
   
 Now, Neither one of the sums look like an Arithmetic or Geometric Progression but a closer view reveals that
 they all have a common second order difference.
 
 The General terms of the sums can be written as.
 
 Tn1 = 1 + 6 * C(n-1, 1) + 8 * C(n-2, 2)
 Tn2 = 1 + 8 * C(n-1, 1) + 8 * C(n-2, 2)
 Tn3 = 1 + 4 * C(n-1, 1) + 8 * C(n-2, 2)
 Tn4 = 1 + 2 * C(n-1, 1) + 8 * C(n-2, 2)
 
 Where C(n, r) denotes "Combinations" or "Choose"
 
 Adding all the terms, and simplifying the expression (using algebra)
 
 Tn1 + Tn2 + Tn3 + Tn4 = 16(n^2) - 28n + 16
 
 Taking Summation on both Sides,
 
 S1 + S2 + S3 + S4 = (16(n^3) - 18(n^2) + 14n) / 3
 
 Now, for a 1*1 Spiral number of terms were 1, for a 3*3 they were 2
 and for n*n spiral number of terms would be (n+1)/2
 
 So, for us n = 1002/2 = 501.
 
 Answer = (S1 + S2 + S3 + S4) - 3    ('3' is being subtracted because we've added '1' four times)
 
 Answer = ((16*(501^3) - 18*(501^2) + 14*501)/3) - 3 = 669171001
 
Saturday, January 14, 2012
]]--