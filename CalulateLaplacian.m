function L = CalulateLaplacian(A,D)
   L = zeros(size(A)); 
   for i=1:size(A,1)
        for j=1:size(A,2)
            L(i,j) = A(i,j) / (sqrt(D(i,i)) * sqrt(D(j,j)));  
        end
    end
end

