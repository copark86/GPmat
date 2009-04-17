% DEMSILHOUETTEGP2 Model silhouette data with independent MLP GPs.

% FORMAT
% DESC runs a simple regression on the Agawal and Triggs data.
%
% SEEALSO : gpCreate, demInterpolation
% 
% COPYRIGHT : Neil D. Lawrence, 2008

% GP

randn('seed', 1e7)
rand('seed', 1e7)

dataSetName = 'silhouette';
experimentNo = 2;

% load data
[X, y, XTest, yTest] = mapLoadData(dataSetName);

% Set up the model
options = gpOptions('ftc');
options.kern{1} = 'mlp';

% Scale outputs to variance 1.
options.scale2var1 = true;

% Use the full Gaussian process model.
q = size(X, 2);
d = size(y, 2);
model = gpCreate(q, d, X, y, options);

display = 1;
iters = 1000;

model = gpOptimise(model, display, iters);
modelDisplay(model)

% Save results
capName = dataSetName;
capName(1) = upper(capName(1));
fileBaseName = ['dem' capName 'Gp' num2str(experimentNo)];
save([fileBaseName '.mat'], 'model');
demSilhouettePlot
