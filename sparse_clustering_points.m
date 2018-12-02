clear
close all
clc
format long
E = csvread('example1.dat.txt');
k = 4;
sigma = 0.5;

 % Test array
 %E = [[1 1 1 2 2 2 3 4 4 4 5 5 6 7 7 8 9 9 9 10 10 11]
 %     [2 3 6 3 4 6 6 5 7 8 7 8 7 8 9 10 10 11 12 11 12 12]]'

 A = CalculateAffinity(E);
 D = diag(sum(A, 2));
 L = CalulateLaplacian(A,D);
 
 [eigenVectors, eigenValues] = eig(L);
 
 X = real(eigenVectors(:, size(eigenVectors, 2) - k + 1 : size(eigenVectors, 2)));
 
 Y = zeros(size(X));
 for i=1:size(X,1)
    rowSum = sqrt(sum(X(i,:).^2));
    if(rowSum == 0.0)
        Y(i,:) = X(i,:);
    else
        Y(i,:) = X(i,:) ./ rowSum; 
    end
 end

 [idx, centroids] = kmeans(Y, k);
 
 colorArray = ["go"; "ro"; "yo"; "mo"; "co"; "bo"; "ko"];
 for i=1:k
    if (i == k)
        plot( E(find(idx == i),1), E(find(idx == i),2), colorArray(i))
    else
        plot( E(find(idx == i),1), E(find(idx == i),2), colorArray(i)); hold on;
    end
 end 
 
 
 
