
function plotNumEQs(EQsPerContinent)

% Creates Figure

figure 

% Gathers the name and amount of the continent by indexing into the continent

names = (EQsPerContinent(:,1));
amount = cell2mat(EQsPerContinent(:,2));


% Creates a horizontal bar graph with the data

barh(amount)

% Gets the ytick labeles with the corresponding names

yticklabels(names)
xlabel('Number of Earthquakes')
