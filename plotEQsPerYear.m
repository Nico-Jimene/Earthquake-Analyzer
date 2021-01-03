% Nicolas Jimenez, nejimene
% nejimene@ncsu.edu
% 11/07/2020
% Section 205
% Project 3: Earthquake Analysis, Fall 2020

function plotEQsPerYear(EQsPerYear, yrRange, scale)

% Gathers the start and ending range from the user input to display in name
% of graph

start_y = yrRange(1);
end_y = yrRange(2);

% Creates Figure

figure 

% Gathers the row and columns in order to properly index the year range

[r c] = find(EQsPerYear >= start_y & EQsPerYear <= end_y);

Corr_year = EQsPerYear(r,1);

Corr_num = EQsPerYear(r,2);


% Plots the corresponding year and number with specific line style, colors,
% and markers

plot(Corr_year, Corr_num, '-bs', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', [1 0 0] )
xlabel('Years')
ylabel('Number of Earthquakes')
grid on
title(sprintf('%s Earthquakes from [%d to %d]',scale, start_y, end_y ));
