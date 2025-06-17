Title: An Integrated Shannon Entropy, SVM and Empirical Mode Decomposition for Gait Neurodegenerative Diseases Classification
1.Introduction
This project proposes An Integrated Shannon Entropy, SVM and Empirical Mode Decomposition framework for classifying neurodegenerative diseases based on gait signals obtained from the PhysioNet Gait Database. The raw gait data is first decomposed using Empirical Mode Decomposition (EMD) to extract meaningful oscillatory modes known as Intrinsic Mode Functions (IMFs).  From these IMFs, Power Spectral Density (PSD)  reveals the energy distribution in the frequency domain, highlighting disease-specific gait patterns. Significant IMF is choosen with PSD and Shannon Entropy quantifies the uncertainty or complexity of  the IMF, and gait features are extracted. These features are then used to train a Multiclass Support Vector Machine (SVM) classifier, enabling classification among multiple neurodegenerative classes. The proposed model is evaluated using standard metrics such as accuracy, precision, recall, and F1-score.
Code Explanation Steps
i)	Load the gait data from physionet database.
ii)	 EMD decomposes a non-stationary and nonlinear signal into a set of simpler components called Intrinsic Mode Functions (IMFs).
imf = emd(signal);  %Decomposes each gait signal into IMFs
iii)	Power spectral density retrieves the significant IMF using periodogram function.
[imf,res]=emd(aa);
p1=periodogram(imf(:,1));
p2=periodogram(imf(:,2));
p3=periodogram(imf(:,3));
p4=periodogram(imf(:,4));
p5=periodogram(imf(:,5));
iv)	 After significant IMF is retrieved, feature extraction is done with Shannon entrophy.
[P, f] = periodogram(signal);
P = P / sum(P);      % Normalize power to get probability
P(P <= 0) = [];           % Remove zeros
H = -sum(P .* log2(P));  %  entropy
v)	After the features are extracted, Multiclass SVM is used to classify the different neurodegenerative diseases and classes. 
vi)	In MATLAB,  comprehensive tools for implementing Support Vector Machines (SVM) for multiclass classification through the fitcecoc function, part of the Statistics and Machine Learning Toolbox is avalaible. fitcsvm function supports binary classification, MATLAB utilizes the Error-Correcting Output Codes (ECOC) strategy to extend SVM to multiclass problems.
The fitcecoc function internally trains multiple binary SVM classifiers, for  one-vs-one  to handle more than two classes. templateSVM function defines the base SVM learner, which supports several kernel types including:
'linear' – for linearly separable data,  'polynomial' – for modeling nonlinear decision boundaries using polynomial transformations, 'rbf' (Gaussian) – for handling complex nonlinear structures in the data, 'sigmoid' – similar to neural network activation functions.
This modular design enables flexible experimentation with different kernel functions  making MATLAB suitable for  neurodegenerative disease identification from gait signals.
3. Description of the dataset
This research work employs the publicly available Gait in Neurodegenerative Disease Database, in PhysioNet  database [Goldberger et al., 2000], which contains gait data recorded from human subjects diagnosed with various neurodegenerative conditions, and healthy controls. The raw data were obtained using force-sensitive resistors, with the output roughly proportional to the force under the foot. Stride-to-stride measures of footfall contact times were derived from these signals. The records in this database are from patients with Parkinson's disease (n = 15), Huntington's disease (n = 20), or amyotrophic lateral sclerosis (n = 13). Records from 16 healthy control subjects are also included here.
A total of 64 subjects  identified by the name of the subject group (hunt, park, als, or control). the gait  data from left and right foot sensors, like those shown in the PhysioNet GaitND database, provides rich information that directly helps in identifying neurodegenerative diseases such as Parkinson’s Disease (PD), Huntington’s Disease (HD), and Amyotrophic Lateral Sclerosis (ALS).
4. Dataset information
Dataset is downloaded from physionet database.
Doi of the dataset: https://doi.org/10.13026/C27G6C
URL: https://www.physionet.org/content/gaitndd/1.0.0/
5. Code is provided in github link
https://github.com/Visvanthan/gaitNDD
6. For Implementation, matlab 2022a is used
i) Load the raw gait data locally from the PhysioNet database.
ii) Open MATLAB and run the following script:
emdmodified.m
This code performs Empirical Mode Decomposition (EMD) and extracts the Intrinsic Mode Functions (IMFs) from the raw signal.
iii) Select Significant IMF Using PSD
To identify significant IMFs, compute the Power Spectral Density (PSD) using periodogram function.
PSD Selects the IMF(s) that show relevant energy characteristics in the gait frequency range.
iv) Run the Shannon.m file in MATLAB:
This extracts 12 entropy-based features for each subject, along their class labels:
HD: Huntington’s Disease
PD: Parkinson’s Disease
ALS: Amyotrophic Lateral Sclerosis
And  Healthy Control
v) Apply Multiclass SVM (One-vs-One)
Use the fitcecoc function in MATLAB to apply multiclass SVM:
Using Classification Learner App in matltab
1.	Open Classification Learner from the Apps tab in MATLAB.
2.	Load the extracted features .csv .
3.	Select Multiclass SVM (One-vs-One) under model options.
4.	Choose a kernel: 'linear', 'rbf', 'sigmoid', or 'polynomial'.
5.	Start training the classifier.
6.	Use the test data to evaluate the trained model.
7.	View the confusion matrix, accuracy, and other performance metrics
7.Requirements
System requirements: Windows 10 operating system, Intel (R) core TM i5-7200U CPU @2.50GHz, RAM :16GB 
Software requirements :Matlab 2022a
8, 9, 10 Not applicable
11. Hardware requirements
 Intel (R) core TM i5-7200U CPU @2.50GHz, RAM :16GB, Graphics card: Intel ® HD Graphics 620 (128MB)
Sofware requirements
Windows 10 operating system, Matlab 2022a

