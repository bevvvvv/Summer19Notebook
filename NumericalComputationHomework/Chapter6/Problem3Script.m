% alpha value
alpha = cos(pi/4);

% create and populate matrix
A = sparse(21, 21);

A(1,1) = -alpha;
A(1,4) = 1;
A(1,5) = alpha;

A(2,1) = alpha;
A(2,3) = 1;
A(2,5) = alpha;

A(3,2) = -1;
A(3,6) = 1;

A(4,3) = -1;
A(4,18) = 1;

A(5,4) = -1;
A(5,8) = 1;

A(6,7) = 1;

A(7,5) = -alpha;
A(7,6) = -1;
A(7,9) = alpha;
A(7,10) = 1;

A(8,5) = -alpha;
A(8,7) = -1;
A(8,9) = -alpha;
A(8,19) = 1;

A(9,8) = -1;
A(9,9) = -alpha;
A(9,12) = 1;
A(9,13) = alpha;

A(10,9) = alpha;
A(10,11) = 1;
A(10,13) = alpha;

A(11,10) = -1;
A(11,14) = 1;

A(12,11) = -1;
A(12,20) = 1;

A(13,13) = -alpha;
A(13,14) = -1;
A(13,17) = 1;

A(14,13) = -alpha;
A(14,15) = -1;
A(14,21) = 1;

A(15,12) = -1;
A(15,16) = alpha;

A(16,15) = 1;
A(16,16) = alpha;

A(17,16) = alpha;
A(17,17) = 1;

% Given forces
A(18,18) = 1;
A(19,19) = 1;
A(20,20) = 1;
A(21,21) = 1;


% Loop over four situations
disp('Forces from f1-f17 then F1-F4.')

% four forces
force =[10, 15, 0, 10;
        15, 0, 0, 10;
        10, 0, 20, 0;
        0, 10, 10, 0];
for i = 1:4
    disp(strcat("Test Case: ",num2str(i)))
    forces = force(i,:);
    b = zeros(1,17);
    b = [b forces];
    b = b';
    disp(A\b)
end













