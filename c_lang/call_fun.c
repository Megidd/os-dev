void caller_fun(){
	callee_fun(0xdede);
}

int callee_fun(int arg){
	return arg;
}
