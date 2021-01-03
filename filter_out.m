% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020

% Self-Made function to remove all of the unecessary hyphens

function out = filter_out(str)
out = strrep(str, '-', '');
end