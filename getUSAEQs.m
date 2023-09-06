
function USA_EQs = getUSAEQs(EQs)

% Gathers all the locations that start with USA

x = startsWith({EQs.location}, 'USA');

% Relays all the appropriate fields to USA_EQs

USA_EQs = EQs(x);

% Updates the structure by adding the stateName field using the latitude
% and longitude fiedls as well as the built in function

for i = 1:length(USA_EQs);
    USA_EQs(i).stateName = findStateOfEQ(USA_EQs(i).lat, USA_EQs(i).long);
end
