clear
close all
clc
format long
E = csvread('example1.dat.txt');
k = 3;
sigma = 0.5;
%{
E = [[1,2] [1,3] [1,6] ...
     [2,3] [2,4] [2,6] ...
     [3,6] ...
     [4,5] [4,7] [4,8]...
     [5,7] [5,8] ...
     [6,7] ...
     [7,8]];
 %}

 E = [[1 1 1 2 2 2 3 4 4 4 5 5 6 7 7 8 9 9 9 10 10 11]
      [2 3 6 3 4 6 6 5 7 8 7 8 7 8 9 10 10 11 12 11 12 12]]';
 
 %{ 
 L = [ [3 -1 -1 0 0 -1 0 0]
       [-1 4 -1 -1 0 -1 0 0]
       [-1 -1 3 0 0 -1 0 0]
       [0 -1 0 4 -1 0 -1 -1]
       [0 0 0 -1 3 0 -1 -1]
       [-1 -1 -1 0 0 4 -1 0]
       [0 0 0 -1 -1 -1 4 -1]
       [0 0 0 -1 -1 0 -1 3] ];
 %}
      
 % A = CalculateAffinity(E)
 %L = 1 / sqrtm(D) * A * 1 / sqrtm(D)
 %L1 = D^(-0.5) .* A .* D^(-0.5)
 col1 = E(:,1);
 col2 = E(:,2);
 size(col1)
 size(col2)
 max(col1,col2)
 max_ids = max(max(col1,col2));
 As = sparse(col1, col2, 1, max_ids, max_ids)
 A = full(As + As')
 D = diag(sum(A, 2))
 %L = D^(-0.5) * A * D^(-0.5);
 L = D - A
 [v, ~] = eig(L)
 %[maxvalue, indx] = max(D)
 %X = real(v(:, size(v, 2) - k + 1 : size(v, 2)))
 X = real(v(:, 1 : k));
 size(X,1)
 
 Y = zeros(size(X));
 for i=1:size(X,1)
    rowSum = sqrt(sum(X(i,:).^2));
    if(rowSum == 0.0)
        Y(i,:) = X(i,:);
    else
        Y(i,:) = X(i,:) ./ rowSum; 
    end
 end
 
 [idx, centroids] = kmeans(Y, k)

 %disp((size(v, 2) - k + 1 ): size(v, 2))
 
 
 
 
 
 