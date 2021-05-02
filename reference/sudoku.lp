% GOAL: just get n*n board of m nums where K is in any row/col ONCE
#const n=6.
#const m=n*n.
#const g=2.

row(1..n).	% I
col(1..n).	% J
val(1..n).	% K

group(I,J,G) :- row(I), col(J),
                D = n / g,
                X = (I - 1) / D, 
                Y = (J - 1) / D,
                G = (Y * g) + X + 1.

% NOTE: m is user given. Must be equal to n*n
% Choice rule: must have 'm' nums
m{ num(I,J,K) : row(I), col(J), val(K) }m.

% NOTE: Rules with no head are used to define invalid properties (any world that agrees with the rule is tossed)
% Toss any world where for two nums with same I and J, they don't also share K (one K per position)
:- num(I,J,K), num(I,J,K'), K != K'.
% Toss any world where for two nums with same J and K, they don't also share I (one K per column)
:- num(I,J,K), num(I',J,K), I != I'.
% Toss any world where for two nums with same I and K, they don't also share J (one K per row)
:- num(I,J,K), num(I,J',K), J != J'.
% Toss any world where for two nums with same I and K, they don't also share I (one K per group)
:- group(I,J,G), group(I',J,G), num(I,J,K), num(I',J,K), I != I'.
% Toss any world where for two nums with same I and K, they don't also share J (one K per group)
:- group(I,J,G), group(I,J',G), num(I,J,K), num(I,J',K), J != J'.

% Somehow (?) use #show to only show num(I,J,K)
#show num/3.