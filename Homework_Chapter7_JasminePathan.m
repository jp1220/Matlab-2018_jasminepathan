%% Q7.1 Structures

% create a structure, mystruct that contains 3 fields.
% mystring : which contains your name
% mychange: a double (default for any number) containing the amount of loose change in your wallet or puse
% mygender: a logical, with 1 for female and 0 for male
mystruct=struct;
mystruct.mystring='Jasmine';
mystruct.mychange=double(1);
mystruct.mygender=1;

% now make a second element in that structure (mystruct(2).fieldname) with
% the same information for someone else (imaginary is fine).
mystruct(2).mystring='Christian';
mystruct(2).mychange=double(2);
mystruct(2).mygender=0;

%% Q 7.2 Cell arrays

% Make a 2 x (individuals) x 3 (fields) cell array that contains all the
% information of the structure above
cells1={mystruct(1), mystruct(2)};

% pull out the name of the second individual.
% pull out the amount of change that you had and add it to amount of change
% the other individual had.
cells1{2}.mystring
cells1{1}.mychange+cells1{2}.mychange

