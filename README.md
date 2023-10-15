<!-- HTML Tags for GitHub README -->
<h1>Predicting Petrobras Stock Prices with Recurrent Neural Networks (RNN)</h1>
<p>This repository contains code for predicting stock prices using a Recurrent Neural Network (RNN). The RNN is implemented with the 'rnn' library in R, and data manipulation is performed using 'dplyr' and 'ggplot2'.</p>
<h2>Table of Contents</h2>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#getting-started">Getting Started</a></li>
  <li><a href="#data">Data</a></li>
  <li><a href="#preprocessing">Preprocessing</a></li>
  <li><a href="#model-training">Model Training</a></li>
  <li><a href="#model-evaluation">Model Evaluation</a></li>
  <li><a href="#results">Results</a></li>
  <li><a href="#visualization">Visualization</a></li>
</ul>

<h2>Introduction</h2>
<p>The code focuses on predicting stock prices, particularly the closing prices, using a Recurrent Neural Network (RNN). The RNN is trained to learn the relationship between today's closing price and the closing price of the previous day, following the concept: y(t) = f(y(t-1)).</p>

<h2>Getting Started</h2>
<p>Before running the code, ensure you have installed the necessary libraries: 'rnn', 'dplyr', and 'ggplot2'. You can install them with the following commands:</p>
<pre>
<code>library("rnn")
library("ggplot2")
library("dplyr")</code>
</pre>

<h2>Data</h2>
<p>The stock price dataset is loaded from the file "PETR4.SA.csv". The code focuses on the closing prices of the stock.</p>

<h2>Preprocessing</h2>
<p>Data is prepared by creating associations with lagged values, where the closing price of the previous day is used to predict the current closing price. Data is organized into a dataframe for analysis. The last row is excluded for preprocessing.</p>

<h2>Model Training</h2>
<p>The RNN model is trained on the preprocessed data. Training parameters include learning rate, hidden dimensions, the number of epochs, and network type (RNN). The training process is controlled using the 'trainr' function.</p>

<h2>Model Evaluation</h2>
<p>The model's performance is assessed using the coefficient of determination (R-squared). The R-squared value measures the percentage of variance in the actual closing prices explained by the predicted values. The model's results are visualized through a plot comparing actual and predicted closing prices.</p>

<h2>Results</h2>
<p>The code provides insights into the R-squared value, which indicates the model's ability to predict stock prices. Additionally, the mean of both actual and predicted values is presented.</p>

<h2>Visualization</h2>
<p>A plot is generated to visualize the actual closing prices (in dark blue) and the predicted closing prices (in dark red) on the testing set. The legend explains the labels for each line.</p>

<p>Please note that this code is a basic example of using an RNN for stock price prediction and is intended for educational purposes. For practical applications, additional features and more advanced models may be necessary.</p>

