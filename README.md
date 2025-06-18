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
iv)	 After significant IMF is retrieved, feature extraction is done with Shannon entropy.
Twelve different features are extracted along with the target class ALS, PD, HD and healthy subjects. 12 different shannon features are extracted with different entropy variants such as Distribution Entropy , Spectral Entropy , Dispersion Entropy , Symbolic Dynamic Entropy , Increment Entropy , Cosine Similarity Entropy , Phase Entropy , Slope Entropy , Bubble Entropy , Gridded Distribution Entropy , Entropy of Entropy and Attention Entropy. All these functions are defined and called
a=xlsread('D:emddecomp.xlsx');
f1 = DistEn(a(:,1));
f2 = SpecEn(a(:,1));
f3 = DispEn(a(:,1));
f4 = SyDyEn(a(:,1));
f5 = IncrEn(a(:,1));
f6 = CoSiEn(a(:,1));
f7 = PhasEn(a(:,1));
f8 = BubbEn(a(:,1));
f9 = GridEn(a(:,1));
f10 = EnofEn(a(:,1));
f11 = AttnEn(a(:,1));
f12 = SlopEn(a(:,1));
feat = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12]
v)	After the features are extracted, Multiclass SVM is used to classify the different neurodegenerative diseases and classes. 
vi)	In MATLAB,  comprehensive tools for implementing Support Vector Machines (SVM) for multiclass classification through the fitcecoc function, part of the Statistics and Machine Learning Toolbox, is available. The fitcsvm function supports binary classification. MATLAB utilises the Error-Correcting Output Codes (ECOC) strategy to extend SVM to multiclass problems.
The fitcecoc function internally trains multiple binary SVM classifiers, for  one-vs-one  to handle more than two classes. The templateSVM function defines the base SVM learner, which supports several kernel types, including:
'linear' – for linearly separable data,  'polynomial' – for modelling nonlinear decision boundaries using polynomial transformations, 'rbf' (Gaussian) – for handling complex nonlinear structures in the data, 'sigmoid' – similar to neural network activation functions.
This modular design enables flexible experimentation with different kernel functions, making MATLAB suitable for  neurodegenerative disease identification from gait signals.
3. Description of the dataset
This research work employs the publicly available Gait in Neurodegenerative Disease Database, in PhysioNet  database, which contains gait data recorded from human subjects diagnosed with various neurodegenerative conditions, and healthy controls. The raw data were obtained using force-sensitive resistors, with the output roughly proportional to the force under the foot. Stride-to-stride measures of footfall contact times were derived from these signals. The records in this database are from patients with Parkinson's disease (n = 15), Huntington's disease (n = 20), or amyotrophic lateral sclerosis (n = 13). Records from 16 healthy control subjects are also included here. Each row in a data represents the right foot and left foot walking patterns of a patient affected by ALS, HD, PD and also the data of healthy subjects.
A total of 64 subjects were identified as HD,PD, ALS and healthy subjects). The gait  data from left and right foot sensors in the PhysioNet GaitND database, provides rich information that directly helps in identifying neurodegenerative diseases such as Parkinson’s Disease (PD), Huntington’s Disease (HD), and Amyotrophic Lateral Sclerosis (ALS).
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
To identify significant IMFs, compute the Power Spectral Density (PSD) using the periodogram function.
PSD selects the IMF(s) that show relevant energy characteristics in the gait frequency range.
iv) Next Run the shannon.m file in MATLAB:
This extracts 12 entropy-based features for each subject, along with their class labels:
HD: Huntington’s Disease
PD: Parkinson’s Disease
ALS: Amyotrophic Lateral Sclerosis
And  Healthy Control
v) Apply Multiclass SVM (One-vs-One) on feature extracted 
Use the fitcecoc function in MATLAB to apply multiclass SVM:
Using Classification Learner App in matlab
i.	Open Classification Learner from the Apps tab in MATLAB.
ii.	Load the extracted features .csv .
iii.	Select Multiclass SVM (One-vs-One) under model options.
iv.	Choose a kernel: 'linear', 'rbf', 'sigmoid', or 'polynomial'.
v.	Start training the classifier.
vi.	Use the test data to evaluate the trained model.
vii.	View the confusion matrix, accuracy, and other performance metrics

7.Requirements
System requirements: Windows 10 operating system, Intel (R) core TM i5-7200U CPU @2.50GHz, RAM :16GB 
Software requirements :Matlab 2022a
8, Not applicable
9,Not applicable
10 Not applicable
11. Hardware requirements
 Intel (R) core TM i5-7200U CPU @2.50GHz, RAM :16GB, Graphics card: Intel ® HD Graphics 620 (128MB)
Sofware requirements
Windows 10 operating system, Matlab 2022a

