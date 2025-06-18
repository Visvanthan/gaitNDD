
function K = laplacianKernel(U, V)
    sigma = 1;  % You can tune this value
    D = pdist2(U, V, 'cityblock');  % L1 norm (Manhattan distance)
    K = exp(-D / sigma);  % Laplacian kernel formula
end
% Create custom SVM template with Laplacian kernel
t = templateSVM('KernelFunction', @laplacianKernel, ...
                'Standardize', true, 'KernelScale', 'auto');

% Train multiclass SVM using ECOC framework
Mdl = fitcecoc(X, Y, 'Learners', t, 'Coding', 'onevsall');

% Display training complete
disp('Multiclass SVM trained with Laplacian kernel.');
cv = cvpartition(Y, 'HoldOut', 0.3);
XTrain = X(training(cv), :);
YTrain = Y(training(cv));
XTest = X(test(cv), :);
YTest = Y(test(cv));

% Train model on training set
Mdl = fitcecoc(XTrain, YTrain, 'Learners', t, 'Coding', 'onevsone');

% Predict
YPred = predict(Mdl, XTest);

% Evaluate
confMat = confusionmat(YTest, YPred);
accuracy = sum(diag(confMat)) / sum(confMat(:));
partitionedModel = crossval(trainedClassifier.ClassificationSVM, 'KFold', 5);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');

% Create the result struct with predict function
svmPredictFcn = @(x) predict(classificationSVM, x);
validationPredictFcn = @(x) svmPredictFcn(x);

% Add additional fields to the result struct


% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse = response(cvp.test, :);
[validationPredictions, validationScores] = validationPredictFcn(validationPredictors);

% Compute validation accuracy
correctPredictions = (validationPredictions == validationResponse);
isMissing = ismissing(validationResponse);
correctPredictions = correctPredictions(~isMissing);
validationAccuracy = sum(correctPredictions)/length(correctPredictions);


