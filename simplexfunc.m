% Fermin Galicia, Math 150

% M stands for matrix, while b and c are vectors
function M = simplexfunc(A,b,c)
% Assemble tableau
format short G
% Assuming thats its feasible
M = [A b;c];
[m,n] = size(M);

running = true; % Continues running until we found basic feasible solution

while running % Check of there are neg. in the last row.
    if(any(M(end,:) < 0))
        [~,J] = min(M(end,1:n)); % Finding the smallest element on last row of Matrix M
        
        if (any(M(:,J) > 0)) % Checking If any value in the tableau from pivot column is greater than zero
            minRatio = inf;

            for i = 1:m
                if (M(i,J) > 0)
                    temp = M(i,end)/M(i,J); % Store the ratios, take the value of b divided by aij.
                    if temp < minRatio
                        minRatio = temp;
                        pivRow = i;
                    end
                end
            end

            % If the temp is less than the ratio, the minRatio will take the temp value. Our pivRow is counting the rows
            % Is pivot equal to one? Yes continue, no scalar multiplication.
            if M(pivRow,J)~=1
                M(pivRow,:) = M(pivRow,:)/M(pivRow,J);
            end

            % Row operation, m=row, n=col, M = Tableau
            for i=1:m % Does not include pivot row for operation
                if i~=pivRow
                    M(i,:) = M(i,:) - M(i,J) * M(pivRow,:); % Every element in the pivot row and column should be zero except the pivot element.
                end
            end

            if all(M(end,:) >= 0)
                 fprintf('Our optimal solution is %g\n', M(m,n)); % Printing corner of optimal (decision & slack variables)
                 BFS = zeros(1,n-1);

                for i=1:n-1
                    if sum(M(1:m-1,i))==1
                        for j=1:m-1
                            if M(j,i)==1
                                BFS(i)=M(j,end);
                            end
                        end
                    end
                end

            disp(BFS()); 
            end
        else
            error("No basic feasible solution."); % If theres no negative values, then we have a optimal solution.
        end   
    else 
        running = false;
    end   
end
end % We reached the end of our codes. 