% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020


function largestEQs = findLargestEQs(EQs, N, whereToPrint)

% Gets the index once findign the string, taking out the hyphens, and sorts
% the magnitude field

[~,index] = sort(filter_out(string({EQs.mag})), 'descend');
largestEQs = EQs(index);

% With largestEQs being the new Struct with ordered fields, the display_
% are used for the displaying portion of this function

display_mag = {largestEQs.mag};
display_year = {largestEQs.year};
display_location = {largestEQs.location};


% If the User inputs 1, then the information is put into the command window

if (whereToPrint == 1);
    fprintf('*****************************************\n');
        for i = 1:N;
            fprintf('%g, %d, %s\n', display_mag{i}, display_year{i}, display_location{i});
        end
    fprintf('*****************************************\n');
% If the User inputs any character, then that becomes the fid for the newly
% opened csv file
else
    fprintf(whereToPrint, 'World Earthquake Report:\n\n');
    fprintf(whereToPrint, 'Top 10 most powerful Earhquakes:\n');
    fprintf(whereToPrint,'*****************************************\n');
        for i = 1:N;
            fprintf(whereToPrint,'%g, %d, %s\n', display_mag{i}, display_year{i}, display_location{i});
        end
    fprintf(whereToPrint,'*****************************************\n\n');
end

% All the largest EQs in order are shown here

largestEQs = largestEQs(1:N);

