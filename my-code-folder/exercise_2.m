clc
clear all
close all


T = readtable("breast-cancer.csv");

T_1 = T(1:560,3:end);

diagnosis = T(1:560,2);  %560*30
diagnosis = diagnosis{:,:};

X = T_1{:,:};%%%The main matrix


% Apply k-means clustering with k=2 
k = 2; 
[idx2, centroids2,sumd2] = kmeans(X, k); %idx is a vector containing 560 elements %If idx2(i) = 1, row i belongs to cluster 1, If idx2(i) = 2, row i belongs to cluster 2



% Choose two features to plot (for visualization)
v1 = 23;
v2 = 24;

% --- Plot clusters ---
figure;
gscatter(X(:,v1), X(:,v2), idx2, 'br', '.', 10); % Cluster 1 blue, Cluster 2 red
hold on;

% Plot centroids in 2D
plot(centroids2(:,v1), centroids2(:,v2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);

% --- Labels and legend ---
xlabel(T_1.Properties.VariableNames{v1});
ylabel(T_1.Properties.VariableNames{v2});
title('Clusters in 2D');
legend('Cluster 1','Cluster 2','Centroids');
grid on;
hold off;



% Extract cluster matrices
X_1 = X(idx2 == 1, :);     % cluster 1 data %include 433 data
X_2 = X(idx2 == 2, :);     % cluster 2 data %include 127 data


%The cluster means
c_1=centroids2(1,:);
c_2=centroids2(2,:);


% --- Centered matrices ---
X1_c = X_1 - c_1;  % subtract row vector from each row
X2_c = X_2 - c_2;

% --- Within-class scatter matrices ---
S_1 = X1_c' * X1_c;  % 30x30
S_2 = X2_c' * X2_c;  % 30x30

% --- Total within-class scatter ---
S_W = S_1 + S_2;


% --- Number of samples in each cluster ---
n1 = size(X_1, 1);   % 433
n2 = size(X_2, 1);   % 127

% --- Overall mean (weighted) ---
c = (n1 * c_1 + n2 * c_2) / (n1 + n2);   % 1x30 row vector

% --- Optional: simplified two-class formula ---
S_B_simple = (n1*n2)/(n1+n2) * (c_2 - c_1)' * (c_2 - c_1);

%   w ... LDA projection direction (unit vector)

% 1. Cholesky factorization: SW = K' * K
K = chol(S_W, 'upper');   % K is upper triangular

% 2. Form the transformed matrix A = K^{-T} * SB * K^{-1}
A = K' \ (S_B_simple / K);       % More stable and faster than inv(K)

% 3. Solve the eigenvalue problem A z = lambda z
% Find the eigenvector corresponding to the largest eigenvalue
[z, D] = eig(A);
[~, idx] = max(diag(D));
z = z(:, idx);

% 4. Recover w from z using w = K^{-1} z
w = K \ z;

% 5. Normalize w
w = w / norm(w);


y = X * w;    

% Extract projected values by cluster
y1 = y(idx2 == 1);   % cluster 1 (433 points)
y2 = y(idx2 == 2);   % cluster 2 (127 points)

% --- Plot the projection on a line ---
figure;
hold on;
scatter(y1, zeros(size(y1)), 20, 'b', 'filled'); % cluster 1
scatter(y2, zeros(size(y2)), 20, 'r', 'filled'); % cluster 2
hold off;

title('Projection of Data onto LDA Direction');
xlabel('Projected value y = Xw');
yticks([]);
legend('Cluster 1','Cluster 2');
grid on;

%%%Explanation: LDA found the best single direction that separates your two clusters.When projecting onto this direction, Cluster 1 and Cluster 2 occupy different—though partially overlapping—ranges. So the clusters are somewhat separable, but not perfectly.
%Optionally, mention LDA: "The LDA direction exists in 30D and maximizes separation. In 2D slices, it can be projected, but the 2D line is only an approximation." Then continue with the 1D projection along LDA (y = X*w) for a clearer demonstration of separability.


