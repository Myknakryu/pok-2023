clear;
close all;
clc;
A = [2,1,1,-1; 
     1,1,-1,1;
     1,1,1,1 ;
     -1,2,-1,1];
B = [3;4;10;4];
AB = [A,B];
RankA = rank(A);
RankAB = rank(AB);
flag = true;
if RankA == RankAB
    disp("Jest jedno rozwiązanie");
elseif RankA < RankAB
     disp("Występuje więcej rozwiązań");
else
    disp("Problem nie posiada rozwiązań");
    flag = false;
end
if flag
    [x,y] = size(AB);
    for i=1:x
        for j=1:x
            if i ~= j
                ratio = AB(j,i) / AB(i,i);
                for k = 1:x+1
                    AB(j,k) = AB(j,k) - ratio*AB(i,k);
                end
            end
        end
    end
end