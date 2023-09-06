
% Beginning Statement with dialogue list

list = {'World', 'USA', 'World Report', 'USA Report'};
indx = listdlg('ListString', list, 'SelectionMode', 'Single');


if (indx == 1) % If World is Selected
    
    % Sets variables for the appropriate scale and will print in command
    % window as shown with wheretoprint being 1
    
    scale = 'World';
    whereToPrint = 1;
    
    % Displays message as well as get the EQs from 'earthquakesDat.csv
    
    fprintf('Getting the Earthquakes from earthquakesData.csv...\n');
    EQs = getEQsFromFile('earthquakesData.csv');
    fprintf('*****************************************\n');
    fprintf('World Analysis\n');
    fprintf('*****************************************\n\n');
    fprintf('Finding earthquakes with the largest magnitude\n');
    
    % Getting the amount of powerful earthquakes through N, the largest EQs
    % are printed the command window
    
    N = input('--> How many most powerful earthquakes would you like to see?:');
    findLargestEQs(EQs, N, whereToPrint);
    fprintf('Determining earthquakes per each year...\n');
    
    % Getting the input for the year ranges, the EQs per Year is then
    % printed as well as plotting them
    
    yrRange = input('--> What year range would you like to plot?:');
    EQsPerYear = determineEQsPerYear(EQs);
    plotEQsPerYear(EQsPerYear, yrRange, scale);
    fprintf('Figure 1: Number of Earthquakes from [%d %d]\n\n', yrRange)
    
    % Gets the EQs per Continenet and displays them in graphical figure
    
    fprintf('Determining earthquakes per each continenet...\n');
    EQsPerContinent = determineNumEQs(EQs, scale, whereToPrint);
    fprintf('Figure 2: Bar Graph of the Number of Earthquakes per continenet\n');
    plotNumEQs(EQsPerContinent);
    
elseif (indx == 2) % IF USA is selected
    
    % Sets variables for the appropriate scale and will print in command
    % window as shown with wheretoprint being 1. Also gets the USA_EQs
    
    scale = 'USA';
    EQs = getEQsFromFile('earthquakesData.csv');
    USA_EQs = getUSAEQs(EQs);
    whereToPrint = 1;
    
    % Prints USA Analysis
    
    fprintf('Getting the Earthquakes from earthquakesData.csv...\n\n')   
    fprintf('*****************************************\n');
    fprintf('USA Analysis\n');
    fprintf('*****************************************\n\n');
    fprintf('Getting only the USA Earthquakes...\n\n');
    fprintf('Finding earthquakes with the largest magnitude\n');
    
    % Gets the input from the user for the amount of earthquakes they wany
    % to see for teh US then is printed
    
    N = input('--> How many most powerful earthquakes would you like to see? ');
    findLargestEQs(USA_EQs, N, whereToPrint);
    fprintf('Determining earthquakes per each year...\n');
    
    % The input that determines the range to print per year as well as plot
    % the EQs in the USA per year
    
    yrRange = input('--> What year range would you like to plot?: ');
    fprintf('Figure 1: Number of Earthquakes from [%d %d]\n', yrRange);
    EQsPerYear = determineEQsPerYear(USA_EQs);
    plotEQsPerYear(EQsPerYear, yrRange, scale);
    
    % Takes the number of EQs per state and creates a new figure to print
    % the EQ map of the United States
    
    fprintf('Determining earthquakes per each state...\n');
    EQsPerState = determineNumEQs(USA_EQs, scale, whereToPrint);
    fprintf('Figure 2: USA map of the Number of Earthquakes per state\n')
    figure();
    createEQMap(EQsPerState);
    
elseif (indx == 3) % If the user selects the World Report
    
    % Gets the EQs from the file as well as determines to display the top
    % 10 earthquakes, gets the scale to be world
    
    EQs = getEQsFromFile('earthquakesData.csv');
    N = 10;
    scale = 'World';
    fprintf('Getting the Earthquakes from earthquakesData.csv...\n');
    fprintf('Report World_EQ_report.csv generated.\n');
    
    % Opens a file to print all the following information on to
    % Largest EQs per continent
   
    whereToPrint = fopen('World_EQ_report.csv', 'w');
    findLargestEQs(EQs, N, whereToPrint);
    fprintf(whereToPrint,'Earthquakes per Continent\n'); 
    determineNumEQs(EQs, scale, whereToPrint);
    statusFclose = fclose(whereToPrint);
    
elseif (indx == 4) % If the user selects USA report
    
    % Gathers the USA_EQs and sets N to 10 for the top 10 strongest
    % Earthquakes. Also has the scale set to USA
    
    EQs = getEQsFromFile('earthquakesData.csv');
    USA_EQs = getUSAEQs(EQs);
    N = 10;
    scale = 'USA';
    fprintf('Getting the Earthquakes from earthquakesData.csv...\n\n');
    fprintf('Getting only the USA Earthquakes...\n\n');
    fprintf('Report USA_EQ_report.csv generated\n');
    
    % Opens up file to display the largest USA_EQs and the number of
    % USA_EQs per state into a csv file   
    whereToPrint = fopen('USA_EQ_report.csv', 'w');
    findLargestEQs(USA_EQs, N, whereToPrint);
    fprintf(whereToPrint,'Earthquakes per State\n'); 
    determineNumEQs(USA_EQs, scale, whereToPrint);
    statusFclose = fclose(whereToPrint);
end

    
    
