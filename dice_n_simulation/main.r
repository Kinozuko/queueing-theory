roll_dice <- function(dice){
	# Funcion que simula el lanzamiento del dado
	return(sample(dice,1));
}

generate_samples <- function(dice,n){
	# Funcion que genera n muestras de los lanzamientos de dos datos
	dice1 = c();
	dice2 = c();

	for(i in 1:n){
		dice1[i] = roll_dice(dice);
		dice2[i] = roll_dice(dice);
	}
	return(data.frame("Dado 1" = dice1,"Dado 2" = dice2));
}

sum_samples <- function(dataframe){
	# Funcion que genera  la suma de una muestra de par de dado
	dices = dataframe[1] + dataframe[2];
	names(dices) <- c("Suma de 2 Dados");
	return(dices);
}

obtain_times_F <- function(sum_samples,F){
	# Funcion que retorna la cantidad de aciertos de F en la muestra de la suma de dos dados
	return(length(sum_samples[sum_samples[1]==F]));
}
obtain_probability_F <- function(sum_samples,F,n){
	# Funcion que obtiene la probabilidad de que la suma sea F -> min(2) max(12)
	return(obtain_times_F(sum_samples,F)/n);
}

print_test <- function(n, F, n_sample, n_sum_sample,hits_F,probability){
	# Funcion que imprime el test
	cat("\nResultados de los dos dados para una muestra de ",n,":\n\n");
	print(n_sample);
	cat("\n\nResultado de sumar ambos dados: \n\n");
	print(n_sum_sample);
	cat("\n\nCantidad de veces que la suma de ambos dados dio ",F,": ",hits_F,"\n");
}

generate_n_test <- function(dice,n,F,show=FALSE){
	# Funcion que genera una muestra de tamano n donde retorna la probabilidad de que F sea la suma de dos dados
	n_sample = generate_samples(dice,n);
	n_sum_sample = sum_samples(n_sample);
	hits_F = obtain_times_F(n_sum_sample,F);
	probability = obtain_probability_F(n_sum_sample,F,n);
	if(show)	print_test(n,F, n_sample,n_sum_sample,hits_F,probability);
	return(probability);
}

generate_m_n_test <- function(dice,m,n,F,show=FALSE){
	#Funcion que genera m veces un a muestra de tamano n donde retorna la probabilidad de que F sea la suma de dos dados en los m tests
	if(m==1){
		cat("\nGenerando ",n," muestras para el lanzamiento de dos dados\n\n");
		probability = generate_n_test(dice,n,F,show);
		cat("\n\nLa probabilidad de que la suma del lanzamiento de dos dados sea de ",F," para una muestra de ",n," es de: ",probability*100,"%\n\n");
	}
	else{
		cat("\nGenerando ",n," muestras para el lanzamiento de dos dados realizado ",m," veces\n\n");
		probability = 0;
		for(i in 1:m){
			probability = probability + generate_n_test(dice,n,F,show);
		}
		cat("\nLa probabilidad de que la suma de dos dados sea de ",F," para una muestra de ",n," realizado ",m," veces es de: ",(probability/m)*100,"%\n\n");		
	}
}

dice <- c(1,2,3,4,5,6);

cat("\n\nSIMULACION CON n=25\n\n");
generate_m_n_test(dice,1,25,5,TRUE);
cat("\n\nSIMULACION CON n=25 REALIZADO m=4 veces\n\n");
generate_m_n_test(dice,4,25,5,TRUE);
cat("\n\nSIMULACION CON n=100\n\n");
generate_m_n_test(dice,1,100,5,TRUE);
cat("\n\nSIMULACION CON n=500\n\n");
generate_m_n_test(dice,1,500,5,TRUE);