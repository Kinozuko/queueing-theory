MM1 <- function(n,lambda,mu){
	i = 0;
	t = rep(0,n);
	size = rep(0,n);
	size[1] = i;
	#print(size); print(t);
	for(j in 2:n){
		if(i==0){
			aux_mu = 0;
		}
		else{
			aux_mu = mu;
		}
		time = -log(runif(1))/(lambda+aux_mu);
		#print(time);
		if(runif(1)<lambda/(lambda+aux_mu)){
			i = i+1;
		}
		else{
			i = i-1;
		}
		#print(i);
		size[j] = i;
		t[j] = time;
		#print(size);
		#print(t);
	}
	t = cumsum(t);
	#print(t);
	plot(t,size,pch=10,type="b")
	data = list(t=t,size=size);
	return(data);
}

GetPromSize <- function(n,data){
	return(sum(data$size)/n);
}


jpeg("example_exercise/plot/E7_n_50.jpg");
print("Simulacion del Ejercicio 7 de la guia con n=50");
data = MM1(50,1/7.5,1/5);
print(GetPromSize(50,data));
aux = dev.off();

jpeg("example_exercise/plot/E6_n_50.jpg");
print("Simulacion del Ejercicio 6 de la guia con n=50");
MM1(50,0.25,0.3);
aux = dev.off();

jpeg("example_exercise/plot/E5_n_50.jpg");
print("Simulacion del Ejercicio 5 de la guia con n=50");
MM1(50,10,15);
aux = dev.off();

jpeg("example_exercise/plot/E4_n_50.jpg");
print("Simulacion del Ejercicio 4 de la guia con n=50");
MM1(50,20,30);
aux = dev.off();
