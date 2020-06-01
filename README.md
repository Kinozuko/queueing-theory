# Queueing Theory Problem

In the current Project there are two problems. This was part of Stadistics Course in Universidad de Carabobo - FaCyT.

**Currently I don't remember from what book were the problems, but probably it was from Canavos**

* In the first problem we run a simulation of N dice to check the probability of  sum of two dices is 5 in 500 samples.

* In the second problem consists in four exercise and consist in simulate MM1 Queue with 50 iterations:

	* Exercise 4
		* ![](/example_exercise/plot/E4_n_50.jpg)
	* Exercise 5
		* ![](/example_exercise/plot/E5_n_50.jpg)
	* Exercise 6
		* ![](/example_exercise/plot/E6_n_50.jpg)
	* Exercise 7
		* ![](/example_exercise/plot/E7_n_50.jpg)

## Structure

```
.
├── dice_n_simulation/
│   └── main.r
├── example_exercise/
│   ├── plot/
│   │   ├── E4_n_50.jpg
│   │   ├── E5_n_50.jpg
│   │   ├── E6_n_50.jpg
│   │   └── E7_n_50.jpg
│   └── main.r
├── .gitignore
├── README.md

```

## Runing Project

### Installing Dependecies

* To run this project you should have installed [R](https://cran.r-project.org/mirrors.html)

### Running Project

* Rscript dice_n_simulation/main.r
* Rscript example_exercise/main.r