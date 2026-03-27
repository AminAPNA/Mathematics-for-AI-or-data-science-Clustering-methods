clc
clear all
close all 

T = readtable("global_population_stats_2024.csv");


numCountries = 15;
totalRows = height(T);
randomIdx = randperm(totalRows, numCountries);

% Extract the corresponding country names and variables
nations = T{randomIdx, 1};
X = T{randomIdx, 2:end};

Y = pdist(X); % compute distances.
squareform(Y); % compute the distance matrix (to visualize if necessary)

% Now cluster hierarchically
Z=linkage(Y);

% Plot the dendogram
figure
H=dendrogram(Z,'labels',nations);








