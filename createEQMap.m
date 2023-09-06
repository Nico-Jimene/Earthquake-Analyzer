function createEQMap(EQsPerState)
%creates a visualization of the US, where each state is assigned a color
%based on the number of earthquakes in the state. It does NOT show AK, HI and PR!
%Inputs: EQsPerState: 2x50 Cell Array, 
%                     1st column is the state's abbreviation
%                     2nd column is the number of EQs in this state
%Output: Colored USA Map

load('states.mat'); %contains state boundaries

%get the highest number of EQs that any state had
highestNumEQs = max([EQsPerState{:,2}]);

hold on;
for i=2:length(states) %don't plot AK
    if (i~= 11) %don't plot HI
        for j = 1:length(states(i).region)
            x =  [states(i).region{j}.longitude ];
            y =  [states(i).region{j}.latitude ];
            thisStNumEQs = EQsPerState{i,2};
            
            fill(y,x, getColor(thisStNumEQs,highestNumEQs));
        end
    end
end
axis equal;
title('USA Earthquakes');
hold off;


end

function color = getColor( numEQs,highestNumEQs )
%Assigns a color to a mood.  The colors are chosen
%based on Cynthia Brewer's Color Brewer (colorbrewer2.com)
%Inputs: mood is a real number between [-1,1]
%Returns: if mood is in the range [-1,1] a 1x3 color value from SENTIMENT_COLORS
%         otherwise it returns GRAY

DIFF_COLORS = { [0.1922 0.2118 0.5843], ...
    [0.2706 0.4588 0.7059], ...
    [0.4549 0.6784 0.8196], ...
    [0.6706 0.8510 0.9137], ...
    [0.8784 0.9529 0.9725], ...
    [1.0000 1.0000 0.7490], ...
    [0.9961 0.8784 0.5647],...
    [0.9922 0.6824 0.3804], ...
    [0.9569 0.4275 0.2627], ...
    [0.8431 0.1882 0.1529], ...
    [0.6471 0      0.1490] };

GRAY = [0.6667, 0.6667, 0.6667];

%figure out the color based on the number of earthquakes.
numColors = length(DIFF_COLORS); %not GRAY

if numEQs >= 1 && numEQs <= highestNumEQs
    [~,Index] = min(abs(numEQs - linspace (1,highestNumEQs,numColors)));
    color = DIFF_COLORS{Index};
else
    color = GRAY;
end


end

