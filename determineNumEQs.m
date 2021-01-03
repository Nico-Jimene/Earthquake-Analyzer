% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020


function EQsPerScale = determineNumEQs(EQs, scale, whereToPrint)
%determines the number or earthquakes per continent OR state
% Input: EQ is a Structure Array with the following fields
%                 year - integer for the year of the earthquake
%             location - char Array for the location
%            continent - char Array for the continent
%                  lat - real number for the latitude
%                 long - real number for the longitude
%                  mag - real number for the magnitude
%         scale - char Array with either 'World' or 'USA'
%  whereToPrint - an integer that identifies WHERE this function
%                 should print.  If it is 1, then print to the
%                 Command Window.  Otherwise, it should be an
%                 identifier to an output file (that is already
%                 opened for writing)
% Returns: EQsPerScale - a Cell Array with 2 columns
%                        1st column: if scale is continent then 1st column is
%                        continents, else it is the USA states
%                        2nd column is the number of earthquakes   


continentsNames = {'North America'; 'South America'; 'Europe'; 'Africa'; ...
    'Australia/Oceania'; 'Asia'; 'Antarctica'};

stateNames = {'AK','AL','AR','AZ','CA','CO','CT','DE','FL','GA','HI','IA',...
    'ID','IL', 'IN','KS','KY','LA','MA','MD','ME','MI','MN','MO',...
    'MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK',...
    'OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY'};


if strcmp(scale, 'World') %continents
    num = length(continentsNames);
    EQsPerScale = continentsNames;
else %per USA state
    num = length(stateNames);
    EQsPerScale = stateNames';
end
%create the counter
numEQs = zeros(1,num);

%counting earthquakes
for i = 1:length(EQs)
    if strcmp(scale, 'World') %continents
        indx = ismember(continentsNames, EQs(i).continent);
    else %per USA state
        indx = ismember(stateNames, EQs(i).stateName);
    end
    %were any erthquakes found
    if any(indx)
        numEQs(indx) = numEQs(indx) + 1;
    end
end

%convert to Cell Array
EQsPerScale(:,2) = num2cell(numEQs');

%printing
fprintf(whereToPrint,'******************************************\n');
for i = 1:num
    fprintf(whereToPrint, '%s, %d\n',EQsPerScale{i,1}, EQsPerScale{i,2});
end
fprintf(whereToPrint,'******************************************\n');


end

