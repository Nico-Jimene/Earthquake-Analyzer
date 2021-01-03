% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020


function EQsPerYear = determineEQsPerYear(EQs)

% Gets the mat values out of the year f ield 

year = cell2mat({EQs.year});

% Gets all the unique years

unq_year = unique(year);

% Finds the amount of unique years there are 

n_year = numel(unq_year);           

% Sets each of the values within n_year to zero to count

count = zeros(n_year,1);

% Going through each iteration the count adds the amount of times the year
% appears

for i = 1:n_year
    count(i) = sum(year == unq_year(i));
end

% Gets the EQs per year by concatinating the years list with the amount 

EQsPerYear = ([unq_year(:) count]);