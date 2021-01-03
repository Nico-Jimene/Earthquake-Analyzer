% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020


function EQs = getEQsFromFile(filename)

% Reads the filename and stores it in quake

Quakes = readcell('earthquakesData.csv');

% Gets rid of the headers 

Quakes = Quakes(2:end,:);

% Stores the newly found info into the EQs structure with different fields

for n = 1:length(Quakes)
    EQs(n).year = Quakes{n,1};
    EQs(n).location = Quakes{n,6};
    EQs(n).continent = Quakes{n,5};
    EQs(n).lat = Quakes{n,7};
    EQs(n).long = Quakes{n, 8};
    EQs(n).mag = Quakes{n,10};
end

end 

